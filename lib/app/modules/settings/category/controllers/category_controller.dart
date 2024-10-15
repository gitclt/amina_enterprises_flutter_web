import 'package:amina_enterprises_flutter_web/app/data/model/settings/pro_category/pro_category_list_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/product_category/pro_category_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = ProCategoryRepository();
  RxList<ProductCategory> data = <ProductCategory>[].obs;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  RxBool isLoading = false.obs;
  String editId = '';
  @override
  void onInit() {
    get();
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getProCategoryList();
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        data.addAll(resData.data!);
      }
    });
  }

  //edit
  void editClick(ProductCategory data) async {
    nameController = TextEditingController(text: data.category);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.categoryAdd);
  }

  edit() async {
    isLoading(true);
    final res = await _repo.editProCategory(id: editId, name: nameController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.category);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  //add

  void add() async {
    isLoading(true);
    final res = await _repo.addProCategory(nameController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.category);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  //delete
  void delete(String id) async {
    final res = await _repo.deleteProCategory(id: id);
    res.fold((failure) {
      Utils.snackBar('Category Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Category', resData.message!);
      get();
    });
  }
}
