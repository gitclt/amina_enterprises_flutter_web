import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;

  RxList<ProductData> data = <ProductData>[].obs;
  RxList<ProductDetail> detailList = <ProductDetail>[].obs;
  RxList<SizeData> sizeList = <SizeData>[].obs;
  final formkey = GlobalKey<FormState>();

  var isIndex = 0.obs;
  late TabController tabcontroller;
  final formkey1 = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController artnoController = TextEditingController();
  TextEditingController mrpController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  // Define an observable boolean for the checkbox state
  var isChecked = false.obs;
  var islaunchChecked = false.obs;
  var isActive = false.obs;

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
  RxBool isSizeLoading = false.obs;

  String editId = '';
  int productId = 0;
  final int pageSize = 10;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
// Separate state for each image
  var pickedFileBytes1 = Rxn<Uint8List>();
  var pickedFileBytes2 = Rxn<Uint8List>();
  var pickedFileBytes3 = Rxn<Uint8List>();
  var pickedFileBytes4 = Rxn<Uint8List>();

  var pickedFilePath1 = ''.obs;
  var pickedFilePath2 = ''.obs;
  var pickedFilePath3 = ''.obs;
  var pickedFilePath4 = ''.obs;

  var encodedData1 = ''.obs;
  var encodedData2 = ''.obs;
  var encodedData3 = ''.obs;
  var encodedData4 = ''.obs;

  String imageName1 = '';
  String imageName2 = '';
  String imageName3 = '';
  String imageName4 = '';
  var pickedFilePath = ''.obs;
  var pickedFileBytes = Rx<Uint8List?>(null); // For web platform
  var encodedData = ''.obs; // Base64 encoded image
  // Uint8List? pickedImageBytes;
  // String encodedData = '';

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
  DropDownModel sdSize = DropDownModel();
  RxList<DropDownModel> sizeDropList = <DropDownModel>[].obs;

  // var selectedTab = 0.obs;
  // selectedTab.animateTo(1);

  List<String> tablabel = ['Basic Information', 'Attributes'];

  void changePage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page; // Update current page
      get(); // Fetch the employee list for the new page
    }
  }

  // void changeTab(int index) {
  //   selectedTab.value = index;
  // }

  @override
  void onInit() {
    get();
    tabcontroller = TabController(vsync: this, length: 2);
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
    // getconstruction();
    getcolor();
    getSubcategory();
    getState();
    getSizeList();
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

  //edit
  void editClick(ProductData data) async {
    productId = data.id!.toInt();
    nameController = TextEditingController(text: data.product);
    artnoController = TextEditingController(text: data.artNo);
    sdMainCat = DropDownModel(
        id: data.mainCategoryId.toString(), name: data.mainCategory);
    sdCat = DropDownModel(id: data.categoryId.toString(), name: data.category);
    sdConstruction = DropDownModel(
      id: '1', // data.constructionId.toString(),
      name: '', //  data.construction
    );
    sdBrand = DropDownModel(id: data.brandId.toString(), name: data.brand);
    sdStatus = DropDownModel(id: data.status.toString(), name: data.status);
    data.newLaunch == 1 ? islaunchChecked.value = true : false;

    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.productAdd);
  }

  editProduct() async {
    isLoading(true);
    isIndex.value = 0;
    tabcontroller.animateTo(0);
    final addedItem = ProductAddModel(
        id: editId,
        name: nameController.text,
        artNo: artnoController.text,
        status: sdStatus.name,
        brandId: sdBrand.id,
        categoryId: sdCat.id,
        constructionId: '1',
        //  sdConstruction.id,
        mainCategoryId: sdMainCat.id,
        newLaunch: islaunchChecked.value == true ? '1' : '0');
    final res = await _repo.updateProduct(data: addedItem);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          isIndex.value = 1;
          tabcontroller.animateTo(1);
          // selectedTab.value = 1;
          // Get.rootDelegate.toNamed(Routes.product);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');
          getdetails();
          // get();

          // clrValue();
        }
      },
    );
  }

  //add

  void addProduct() async {
    isLoading(true);
    final addedItem = ProductAddModel(
        status: sdStatus.id,
        artNo: artnoController.text,
        brandId: sdBrand.id,
        categoryId: sdCat.id,
        constructionId: '1',
        //  sdConstruction.id,
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
          isIndex.value = 1;
          tabcontroller.animateTo(1);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          getdetails();

          // clrValue();
        }
      },
    );
  }

//   void addProductItem() async {
//     isLoading(true);
//     final selectedItem =
//         sizeList.where((e) => e.isSelect.value == true).toList();
//     final addedItem = selectedItem
//         .map((item) => ProductitemAddModel(
//               proId: productId,
//               status: item.status!.value == true ? 'Active' : 'Inactive',
//               mrp: int.tryParse(item.mrpController?.text ?? '0'),
//               colorId: int.tryParse('${sdColor.id}'),
//               isDisplay: 0,
//               size: int.tryParse('${item.id}'),
//               subCatId: int.tryParse('${sdSubCat.id}'),
//               stock: int.tryParse(item.stockController?.text ?? '0'),
//               stateId: int.tryParse('${sdState.id}'),
//               image1: imageName,
//               image2: "String.jpg",
//               image3: "String.jpg",
//               image4: "String.jpg",
//               image5: "String.jpg",
//             ))
//         .toList();
//     final res = await _repo.addProductItem(data: addedItem);
//     res.fold(
//       (failure) {
//         isLoading(false);
//         Utils.snackBar('Error', failure.message);
//         setError(error.toString());
//       },
//       (resData) {
//         if (resData.status!) {
//           isLoading(false);
//           Utils.snackBar('Sucess', resData.message ?? '', type: 'success');
//  _repo.uploadToServerImage(
//                 data: encodedData.value,
//                 imagename: imageName);
//     res.fold(
//       (failure) {
//         isLoading(false);
//         Utils.snackBar('Error', failure.message);
//         setError(error.toString());
//       },
//       (resData) {
//         if (resData.status!) {
//           isLoading(false);
//           Get.rootDelegate.toNamed(Routes.brand);
//           Utils.snackBar('Sucess', resData.message ?? '', type: 'success');
//         }
//       },
//     );
//           getdetails();
//           update();
//           // clrValue();
//         }
//       },
//     );
//   }

  void addProductItem() async {
    isLoading(true);
    final selectedItem =
        sizeList.where((e) => e.isSelect.value == true).toList();

    final addedItem = selectedItem.map((item) {
      return ProductitemAddModel(
        proId: productId,
        status: item.status!.value == true ? 'Active' : 'Inactive',
        mrp: int.tryParse(item.mrpController?.text ?? '0'),
        colorId: int.tryParse('${sdColor.id}'),
        isDisplay: 0,
        size: int.tryParse('${item.id}'),
        subCatId: int.tryParse('${sdSubCat.id}'),
        stock: int.tryParse(item.stockController?.text ?? '0'),
        stateId: int.tryParse('${sdState.id}'),
        image1: imageName1,
        image2: imageName2,
        image3: imageName3,
        image4: imageName4,
      );
    }).toList();

    final res = await _repo.addProductItem(data: addedItem);

    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(failure.message);
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          List<Map<String, String>> images = [
            {"img": encodedData1.value, "imgName": imageName1},
            {"img": encodedData2.value, "imgName": imageName2},
            {"img": encodedData3.value, "imgName": imageName3},
            {"img": encodedData4.value, "imgName": imageName4},
          ];
          _repo.uploadToServerImage(images: images);

          res.fold(
            (failure) {
              isLoading(false);
              Utils.snackBar('Error', failure.message);
            },
            (resData) {
              if (resData.status!) {
                // Get.rootDelegate.toNamed(Routes.);
                Utils.snackBar('Success', resData.message ?? '',
                    type: 'success');
                clearProductItem();
                getSize();
                getdetails();
                update();
              }
            },
          );
        }
      },
    );
  }

  clearProductItem() {
    sizeList.clear();
    stockController = TextEditingController(text: '');
    mrpController = TextEditingController(text: '');
    sdSubCat = DropDownModel(id: '', name: '');
    sdColor = DropDownModel(id: '', name: '');
    sdState = DropDownModel(id: '', name: '');
  }

  //edit
  editIteamClick(
    ProductDetail data,
  ) async {
    productId = data.proId!;
    sdSubCat =
        DropDownModel(id: data.subCatId.toString(), name: data.subcategory);
    sdColor = DropDownModel(id: data.color, name: data.color);
    mrpController = TextEditingController(text: data.mrp.toString());
    stockController = TextEditingController(text: data.stock.toString());
    sdSize = DropDownModel(id: data.sizeId.toString(), name: data.size);
    editId = data.id.toString();
    sdState = DropDownModel(id: data.stateId.toString(), name: data.state);
    // Update picked file paths with existing image URLs (or empty if none)
    pickedFilePath1.value = data.image1Url ?? '';
    pickedFilePath2.value = data.image2Url ?? '';
    pickedFilePath3.value = data.image3Url ?? '';
    pickedFilePath4.value = data.image4Url ?? '';
  }

  editProductItem() async {
    isLoading(true);

    final addedItem = ProductitemAddModel(
      id: editId,
      colorId: int.tryParse(
        sdColor.id.toString(),
      ),
      mrp: int.tryParse(mrpController.text),
      stock: int.tryParse(stockController.text),
      size: int.tryParse("${sdSize.id}"),
      proId: productId,
      stateId: int.tryParse('${sdState.id}'),
      subCatId: int.tryParse('${sdSubCat.id}'),
      status: isActive.value == true ? 'Active' : 'Inactive',
      isDisplay: 0,
      image1: "string.jpg",
      image2: "String.jpg",
      image3: "String.jpg",
      image4: "String.jpg",
      image5: "String.jpg",
    );

    final res = await _repo.editProductItem(data: addedItem);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          // selectedTab.value = 1;
          // Get.rootDelegate.toNamed(Routes.product);
          Get.back();
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');
          getdetails();
          // get();

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

  //delete
  void deleteProductItem(String id) async {
    final res = await _repo.deleteProductItem(id: id);
    res.fold((failure) {
      Utils.snackBar('Product Iteam Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Product Item', resData.message!);
      getdetails();
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
    stateDropList.clear();
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

  void getSizeList() async {
    isSizeLoading(true);
    sizeDropList.clear();
    final res = await sizerepo.getList();
    res.fold((failure) {
      isSizeLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isSizeLoading(false);

      for (var item in resData.data!) {
        sizeDropList
            .add(DropDownModel(id: item.id.toString(), name: item.size));
      }
    });
  }

// Function to pick image and generate a unique name
  void pickImage(int imageIndex) async {
    String dateFormat = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Generate a unique identifier using the current timestamp
    String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();

    if (GetPlatform.isWeb) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null) {
        PlatformFile file = result.files.single;

        // Update the specific image's state based on the imageIndex
        if (imageIndex == 1) {
          pickedFileBytes1.value = file.bytes;
          pickedFilePath1.value = file.name;
          imageName1 = "$dateFormat-$uniqueId.${file.name.split('.').last}";
          encodedData1.value = base64Encode(pickedFileBytes1.value!);
        } else if (imageIndex == 2) {
          pickedFileBytes2.value = file.bytes;
          pickedFilePath2.value = file.name;
          imageName2 = "$dateFormat-$uniqueId.${file.name.split('.').last}";
          encodedData2.value = base64Encode(pickedFileBytes2.value!);
        } else if (imageIndex == 3) {
          pickedFileBytes3.value = file.bytes;
          pickedFilePath3.value = file.name;
          imageName3 = "$dateFormat-$uniqueId.${file.name.split('.').last}";
          encodedData3.value = base64Encode(pickedFileBytes3.value!);
        } else if (imageIndex == 4) {
          pickedFileBytes4.value = file.bytes;
          pickedFilePath4.value = file.name;
          imageName4 = "$dateFormat-$uniqueId.${file.name.split('.').last}";
          encodedData4.value = base64Encode(pickedFileBytes4.value!);
        }
      }
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null) {
        // Update the specific image's state based on the imageIndex
        if (imageIndex == 1) {
          pickedFilePath1.value = result.files.single.path!;
          var pickedImageBytes1 =
              await File(pickedFilePath1.value).readAsBytes();
          imageName1 =
              "$dateFormat-$uniqueId.${pickedFilePath1.value.split('.').last}";
          encodedData1.value = base64Encode(pickedImageBytes1);
        } else if (imageIndex == 2) {
          pickedFilePath2.value = result.files.single.path!;
          var pickedImageBytes2 =
              await File(pickedFilePath2.value).readAsBytes();
          imageName2 =
              "$dateFormat-$uniqueId.${pickedFilePath2.value.split('.').last}";
          encodedData2.value = base64Encode(pickedImageBytes2);
        } else if (imageIndex == 3) {
          pickedFilePath3.value = result.files.single.path!;
          var pickedImageBytes3 =
              await File(pickedFilePath3.value).readAsBytes();
          imageName3 =
              "$dateFormat-$uniqueId.${pickedFilePath3.value.split('.').last}";
          encodedData3.value = base64Encode(pickedImageBytes3);
        } else if (imageIndex == 4) {
          pickedFilePath4.value = result.files.single.path!;
          var pickedImageBytes4 =
              await File(pickedFilePath4.value).readAsBytes();
          imageName4 =
              "$dateFormat-$uniqueId.${pickedFilePath4.value.split('.').last}";
          encodedData4.value = base64Encode(pickedImageBytes4);
        }
      }
    }
  }

  clear() {
    editId = '';
    nameController.clear();
    artnoController.clear();
    mrpController.clear();
    stockController.clear();
    detailList.clear();
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
