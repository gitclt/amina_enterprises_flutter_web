import 'package:amina_enterprises_flutter_web/app/data/model/settings/size/size_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/main_category/main_category_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/product_category/pro_category_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/size/size_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeController extends GetxController {
  final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isCatLoading = false.obs;
  RxBool isMainCatLoading = false.obs;
  final formkey = GlobalKey<FormState>();
  final _repo = SizeRepository();
  final proCatRepo = ProCategoryRepository();
  final mainCatRepo = MainCategoryRepository();
  TextEditingController nameController = TextEditingController();
  RxList<SizeData> data = <SizeData>[].obs;
  DropDownModel dropDownMainCat = DropDownModel();
  RxList<DropDownModel> mainCatDropList = <DropDownModel>[].obs;
  DropDownModel dropDownCategory = DropDownModel();
  RxList<DropDownModel> categoryDropList = <DropDownModel>[].obs;

  var dropDownType = Rxn<DropDownModel>();
  var istypeLoading = false.obs;

  List<DropDownModel> typeDropList = [
    DropDownModel(id: 'pair', name: "pair"),
    DropDownModel(id: 'carton', name: 'carton'),
  ];

  String editId = '';

  @override
  void onInit() {
    get();
    getCategoryList();
    getMainCategoryList();
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getList();
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

  Future<void> getCategoryList() async {
    isCatLoading(true);
    categoryDropList.clear();
    categoryDropList.add(DropDownModel(id: '', name: '--Select Category--'));
    final res = await proCatRepo.getProCategoryList();
    res.fold((failure) {
      isCatLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isCatLoading(false);
      for (var item in resData.data!) {
        categoryDropList
            .add(DropDownModel(id: item.id.toString(), name: item.category));
      }
    });
  }

  Future<void> getMainCategoryList() async {
    isMainCatLoading(true);
    mainCatDropList.clear();
    mainCatDropList
        .add(DropDownModel(id: '', name: '--Select Main Category--'));
    final res = await mainCatRepo.getList();
    res.fold((failure) {
      isMainCatLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isMainCatLoading(false);
      for (var item in resData.data!) {
        mainCatDropList
            .add(DropDownModel(id: item.id.toString(), name: item.name));
      }
    });
  }

  void delete(String id) async {
    final res = await _repo.delete(id: id);
    res.fold((failure) {
      Utils.snackBar('Size Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Size', resData.message!);
      get();
    });
  }

  void editClick(SizeData data) {
    nameController = TextEditingController(text: data.size);
    dropDownCategory =
        DropDownModel(id: data.catId.toString(), name: data.procCategory);
    dropDownMainCat =
        DropDownModel(id: data.mainCatId.toString(), name: data.mainCategory);
    dropDownType.value = DropDownModel(id: data.type, name: data.type);
    editId = data.id.toString();

    Get.rootDelegate.toNamed(Routes.sizeAdd);
  }

  void add() async {
    isLoading(true);
    final res = await _repo.add(
        nameController.text,
        dropDownMainCat.id.toString(),
        dropDownCategory.id.toString(),
        dropDownType.value?.id.toString() ?? '');
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.size);
          Utils.snackBar('Success', resData.message ?? '', type: 'success');

          get();
        }
      },
    );
  }

  void edit() async {
    isLoading(true);
    final res = await _repo.edit(
        editId,
        nameController.text,
        dropDownMainCat.id.toString(),
        dropDownCategory.id.toString(),
        dropDownType.value?.id.toString() ?? '');
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.size);
          Utils.snackBar('Success', resData.message ?? '', type: 'success');

          get();
        }
      },
    );
  }

  clear() {
    editId = '';
    nameController.clear();
    dropDownCategory = DropDownModel(id: '', name: '--Select Category--');
    dropDownMainCat = DropDownModel(id: '', name: '--Select Main Category--');
    dropDownType.value = DropDownModel(id: '', name: '--Select Type--');
  }
}
