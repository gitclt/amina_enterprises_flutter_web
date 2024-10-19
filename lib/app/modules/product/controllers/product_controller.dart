import 'package:amina_enterprises_flutter_web/app/constants/const_valus.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/product/product_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/brand/brand_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/construction/construction_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/main_category/main_category_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/product_category/pro_category_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = ProductRepository();
  RxList<ProductData> data = <ProductData>[].obs;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController artnoController = TextEditingController();
  //loading
  RxBool isLoading = false.obs;
  RxBool isMaincatLoading = false.obs;
  RxBool isCatLoading = false.obs;
  RxBool isConstructionLoading = false.obs;
  RxBool isBrandLoading = false.obs;

  String editId = '';
  final int pageSize = 10;
  var currentPage = 1.obs;
  var totalPages = 1.obs;

//repositoy
  final mainCatrepo = MainCategoryRepository();
  final catrepo = ProCategoryRepository();
  final brandrepo = BrandRepository();
  final constructionrepo = ConstructionRepository();

  DropDownModel sdStatus = DropDownModel();
  RxList<DropDownModel> statusDropList = <DropDownModel>[].obs;
  DropDownModel sdMainCat = DropDownModel();
  RxList<DropDownModel> mainCatDropList = <DropDownModel>[].obs;
  DropDownModel sdCat = DropDownModel();
  RxList<DropDownModel> categoryDropList = <DropDownModel>[].obs;
  DropDownModel sdConstruction = DropDownModel();
  RxList<DropDownModel> constructionDropList = <DropDownModel>[].obs;
  DropDownModel sdBrand = DropDownModel();
  RxList<DropDownModel> brandDropList = <DropDownModel>[].obs;

  var selectedTab = 0.obs;
  // selectedTab.animateTo(1);

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
    initialValues();
    super.onInit();
  }

  initialValues() {
    for (var v in AppConstValue().statusTypes) {
      statusDropList.add(DropDownModel(id: v.id.toString(), name: v.name));
    }
    getMainCat();
    getCat();
    getBrand();
    getconstruction();
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

  //add

  void addProduct() async {
    isLoading(true);
    final addedItem = ProductAddModel(
        activeStatus: sdStatus.id,
        artNo: artnoController.text,
        brandId: sdBrand.id,
        categoryId: sdCat.id,
        constructionId: sdConstruction.id,
        mainCategoryId: sdMainCat.id,
        name: nameController.text,
        newLaunch: '0');
    final res = await _repo.addProduct(data: addedItem);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          selectedTab.value = 1;

          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

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

  void getMainCat() async {
    isMaincatLoading(true);
    mainCatDropList.clear();
    final res = await mainCatrepo.getList();
    res.fold((failure) {
      isMaincatLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isMaincatLoading(false);

      for (var state in resData.data!) {
        mainCatDropList
            .add(DropDownModel(id: state.id.toString(), name: state.name));
      }
    });
  }

  void getCat() async {
    isCatLoading(true);
    mainCatDropList.clear();
    final res = await catrepo.getProCategoryList();
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

  void getBrand() async {
    isBrandLoading(true);
    brandDropList.clear();
    final res = await brandrepo.brandList();
    res.fold((failure) {
      isBrandLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isBrandLoading(false);

      for (var item in resData.data!) {
        brandDropList
            .add(DropDownModel(id: item.id.toString(), name: item.name));
      }
    });
  }

  void getconstruction() async {
    isConstructionLoading(true);
    constructionDropList.clear();
    final res = await constructionrepo.getList();
    res.fold((failure) {
      isConstructionLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isConstructionLoading(false);

      for (var item in resData.data!) {
        constructionDropList
            .add(DropDownModel(id: item.id.toString(), name: item.name));
      }
    });
  }

  clear() {
    editId = '';
    nameController.clear();
    artnoController.clear();
    sdStatus = DropDownModel(); // Reset selected dropdowns
    sdMainCat = DropDownModel();
    sdCat = DropDownModel();
    sdBrand = DropDownModel();
    sdConstruction = DropDownModel();
  }
}
