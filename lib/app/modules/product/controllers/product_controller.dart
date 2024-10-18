import 'package:amina_enterprises_flutter_web/app/constants/const_valus.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/product/product_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = ProductRepository();
  RxList<ProductData> data = <ProductData>[].obs;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  RxBool isLoading = false.obs;
  String editId = '';
  final int pageSize = 10;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  DropDownModel sdStatus = DropDownModel();
  RxList<DropDownModel> statusDropList = <DropDownModel>[].obs;

  var selectedTab = 0.obs;
  List<String> tablabel = ['Basic Information', 'Attributes'];

  void changePage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page; // Update current page
      get(); // Fetch the employee list for the new page
    }
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }

  @override
  void onInit() {
    get();
    for (var v in AppConstValue().statusTypes) {
      statusDropList.add(DropDownModel(id: v.id.toString(), name: v.name));
    }
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getProductList(pageSize, currentPage.value);
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        data.addAll(resData.data!);
        totalPages.value = 50;
        // (resData.totalCount! / pageSize).ceil();
      }
    });
  }

  // //edit
  // void editClick(DesignationData data) async {
  //   nameController = TextEditingController(text: data.designation);
  //   editId = data.id.toString();
  //   Get.rootDelegate.toNamed(Routes.designationAdd);
  // }

  // editDesignation() async {
  //   isLoading(true);
  //   final res =
  //       await _repo.editDesignation(id: editId, name: nameController.text);
  //   res.fold(
  //     (failure) {
  //       isLoading(false);
  //       Utils.snackBar('Error', failure.message);
  //       setError(error.toString());
  //     },
  //     (resData) {
  //       if (resData.status!) {
  //         isLoading(false);
  //         Get.rootDelegate.toNamed(Routes.designation);
  //         Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

  //         get();

  //         // clrValue();
  //       }
  //     },
  //   );
  // }

  // //add

  // void addDesignation() async {
  //   isLoading(true);
  //   final res = await _repo.addDesignation(nameController.text);
  //   res.fold(
  //     (failure) {
  //       isLoading(false);
  //       Utils.snackBar('Error', failure.message);
  //       setError(error.toString());
  //     },
  //     (resData) {
  //       if (resData.status!) {
  //         isLoading(false);
  //         Get.rootDelegate.toNamed(Routes.product);
  //         Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

  //         get();

  //         // clrValue();
  //       }
  //     },
  //   );
  // }

  // //delete
  // void delete(String id) async {
  //   final res = await _repo.deleteDesignation(id: id);
  //   res.fold((failure) {
  //     Utils.snackBar('Product Error', failure.message);
  //     setError(error.toString());
  //   }, (resData) {
  //     Utils.snackBar('Product', resData.message!);
  //     get();
  //   });
  // }

  clear() {
    editId = '';
    nameController.clear();
  }
}
