import 'package:amina_enterprises_flutter_web/app/constants/const_valus.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/pro_item_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_detail_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/size/size_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/product/product_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/brand/brand_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/color/color_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/construction/construction_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/main_category/main_category_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/pro_sub_category/pro_sub_category_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/product_category/pro_category_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/size/size_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/state/state_repository.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;

  RxList<ProductData> data = <ProductData>[].obs;
  RxList<Datum> detailList = <Datum>[].obs;
  RxList<SizeData> sizeList = <SizeData>[].obs;
  final formkey = GlobalKey<FormState>();

  final formkey1 = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController artnoController = TextEditingController();
  // TextEditingController mrpController = TextEditingController();
  // TextEditingController stockController = TextEditingController();
  // Define an observable boolean for the checkbox state
  var isChecked = false.obs;
  var islaunchChecked = false.obs;

  // Toggle the checkbox value
  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  void launchCheckbox() {
    islaunchChecked.value = !islaunchChecked.value;
  }

  // Track the status (Active/Inactive) for each item
  var statuses = List<String>.filled(10, "Inactive")
      .obs; // Modify the length based on your data

  // Update status (Active/Inactive) for a specific index
  void setStatus(int index, String status) {
    statuses[index] = status;
  }

  //loading
  RxBool isLoading = false.obs;
  RxBool isMaincatLoading = false.obs;
  RxBool isCatLoading = false.obs;
  RxBool isConstructionLoading = false.obs;
  RxBool isBrandLoading = false.obs;
  RxBool isSubCatLoading = false.obs;
  RxBool isColorLoading = false.obs;
  RxBool isStateLoading = false.obs;

  String editId = '';
  int productId = 0;
  final int pageSize = 10;
  var currentPage = 1.obs;
  var totalPages = 1.obs;

//repositoy
  final _repo = ProductRepository();
  final sizerepo = SizeRepository();
  final mainCatrepo = MainCategoryRepository();
  final catrepo = ProCategoryRepository();
  final brandrepo = BrandRepository();
  final constructionrepo = ConstructionRepository();
  final subCatrepo = ProSubCategoryRepository();
  final colorrepo = ColorRepository();
  final staterepo = StateRepository();

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
  DropDownModel sdSubCat = DropDownModel();
  RxList<DropDownModel> subcatDropList = <DropDownModel>[].obs;
  DropDownModel sdColor = DropDownModel();
  RxList<DropDownModel> colorDropList = <DropDownModel>[].obs;
  DropDownModel sdState = DropDownModel();
  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;

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
    getSize();
    getMainCat();
    getCat();
    getBrand();
    getconstruction();
    getcolor();
    getSubcategory();
    getState();
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

  void getdetails() async {
    setRxRequestStatus(Status.loading);
    detailList.clear();
    final res = await _repo.getProductDetails(proId: productId);
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        detailList.addAll(resData.data!);
      }
    });
  }

  // void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  // void setError(String value) => error.value = value;

  void getSize() async {
    setRxRequestStatus(Status.loading);
    sizeList.clear();
    final res = await sizerepo.getList();
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        sizeList.addAll(resData.data!);
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
        newLaunch: islaunchChecked.value == true ? '1' : '0');
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
          productId = resData.data!.id!;
          selectedTab.value = 1;

          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          getdetails();

          // clrValue();
        }
      },
    );
  }

  void addProductItem() async {
    isLoading(true);
    final selectedItem =
        sizeList.where((e) => e.isSelect.value == true).toList();
    final addedItem = selectedItem
        .map((item) => ProductitemAddModel(
              proId: productId,
              status: sdStatus.name,
              mrp: int.tryParse(item.mrpController?.text ?? '0'),
              colorId: int.tryParse('${sdColor.id}'),
              isDisplay: 0,
              size: int.tryParse('${item.size}'),
              subCatId: int.tryParse('${sdSubCat.id}'),
              stock: int.tryParse(item.stockController?.text ?? '0'),
              stateId: int.tryParse('${sdState.id}'),
              image1: "String.jpg",
              image2: "String.jpg",
              image3: "String.jpg",
              image4: "String.jpg",
              image5: "String.jpg",
            ))
        .toList();
    final res = await _repo.addProductItem(data: addedItem);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          // productId = resData.data!.id.toString();
          // selectedTab.value = 1;

          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          getdetails();

          // clrValue();
        }
      },
    );
  }

  //delete
  void delete(String id) async {
    final res = await _repo.deleteProduct(id: id);
    res.fold((failure) {
      Utils.snackBar('Product Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Product', resData.message!);
      get();
    });
  }

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

  void getSubcategory() async {
    isSubCatLoading(true);
    subcatDropList.clear();
    final res = await subCatrepo.getList();
    res.fold((failure) {
      isSubCatLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isSubCatLoading(false);

      for (var item in resData.data!) {
        subcatDropList
            .add(DropDownModel(id: item.id.toString(), name: item.name));
      }
    });
  }

  void getcolor() async {
    isColorLoading(true);
    colorDropList.clear();
    final res = await colorrepo.getList();
    res.fold((failure) {
      isColorLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isColorLoading(false);

      for (var item in resData.data!) {
        colorDropList
            .add(DropDownModel(id: item.id.toString(), name: item.name));
      }
    });
  }

  void getState() async {
    isStateLoading(true);
    colorDropList.clear();
    final res = await staterepo.getList();
    res.fold((failure) {
      isStateLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isStateLoading(false);

      for (var item in resData.data!) {
        stateDropList
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
    sdSubCat = DropDownModel();
    sdColor = DropDownModel();
    sdState = DropDownModel();
  }
}
