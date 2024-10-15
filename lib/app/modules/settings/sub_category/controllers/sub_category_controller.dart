import 'package:amina_enterprises_flutter_web/app/data/model/settings/pro_category/pro_category_list_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/pro_sub_category/pro_sub_category_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/pro_sub_category/pro_sub_category_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/product_category/pro_category_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryController extends GetxController {
  final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  RxBool isAddLoading = false.obs;
  String editId = '';
  // String proCatId = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController subnameController = TextEditingController();

  RxList<ProSubCategory> subCategoryList = <ProSubCategory>[].obs;
  RxList<ProSubCategory> subCategoryListCopy = <ProSubCategory>[].obs;
  RxList<DropDownModel> productCatDropList = <DropDownModel>[].obs;
  DropDownModel sdsubCategory = DropDownModel();
  RxList<ProductCategory> categoryList = <ProductCategory>[].obs;
  RxBool isLoading = false.obs;
  final formkey = GlobalKey<FormState>();

  final _subCatRepo = ProSubCategoryRepository();
  final _proCatRepo = ProCategoryRepository();
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  @override
  void onInit() {
    getsubCategoryList();
    getcategoryList();
    super.onInit();
  }

//view
  // void setcategoryList(List<ProCategoryListData> value) {
  //   categoryList.clear();

  //   categoryList.addAll(value);
  // }

  void getcategoryList() async {
    isAddLoading(true);
    productCatDropList.clear();
    productCatDropList.add(DropDownModel(id: '', name: '--Select Category--'));
    final res = await _proCatRepo.getProCategoryList();
    res.fold((failure) {
      isAddLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isAddLoading(false);
      for (var item in resData.data!) {
        productCatDropList
            .add(DropDownModel(id: item.id.toString(), name: item.category));
      }
//       if (resData.data != null) {
//         setRxRequestStatus(Status.completed);
// productCatDropList
//             .add(DropDownModel(id: item.id.toString(), name: item.name));

//       }
    });
  }

//search
  void searchData(String value) {
    subCategoryList.clear();

    if (value.isEmpty) {
      subCategoryList.addAll(subCategoryListCopy);
    } else {
      subCategoryList.clear();
      subCategoryList.addAll(subCategoryListCopy
          .where(
              (data) => data.name!.toLowerCase().contains(value.toLowerCase()))
          .toList());
    }
  }

//view
  void setSubcategoryList(List<ProSubCategory> value) {
    subCategoryList.clear();
    subCategoryListCopy.clear();
    subCategoryList.addAll(value);
    subCategoryListCopy.addAll(value);
  }

  void getsubCategoryList() async {
    setRxRequestStatus(Status.loading);

    final res = await _subCatRepo.getList();
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      if (resData.data != null) {
        setRxRequestStatus(Status.completed);

        // if (resData.data == null || resData.data!.isEmpty) return;

        setSubcategoryList(resData.data!);
      }
    });
  }
  //add

  void addsubCategory() async {
    isLoading(true);
    final res =
        await _subCatRepo.add(nameController.text, sdsubCategory.id ?? '');
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.subCategory);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          getsubCategoryList();

          // clrValue();
        }
      },
    );
  }

  //edit
  void editClick(ProSubCategory data) async {
    nameController = TextEditingController(text: data.name);
    editId = data.id.toString();
    // proCatId = data.procatId.toString();
    subnameController.text = data.procategory.toString();

    Get.rootDelegate.toNamed(Routes.subCategoryAdd);
  }

  editsubCategory() async {
    isLoading(true);
    final res = await _subCatRepo.edit(
        id: editId,
        name: nameController.text,
        procatid: sdsubCategory.id ?? '');
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.subCategory);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          getsubCategoryList();

          // clrValue();
        }
      },
    );
  }

  //delete
  void delete(String id) async {
    final res = await _subCatRepo.delete(id: id);
    res.fold((failure) {
      Utils.snackBar('SubCategory Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('SubCategory', resData.message!);
      getsubCategoryList();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
    subnameController.clear();
    sdsubCategory = DropDownModel();
    // proCatId = '';
  }
}
