import 'dart:convert';
import 'dart:io';

import 'package:amina_enterprises_flutter_web/app/data/model/settings/brand/brand_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/brand/brand_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = BrandRepository();
  RxList<Brand> data = <Brand>[].obs;
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
    final res = await _repo.brandList();
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
  void editClick(Brand data) async {
    nameController = TextEditingController(text: data.name);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.brandAdd);
  }

  edit() async {
    isLoading(true);
    final res =
        await _repo.editBrand(id: editId, name: nameController.text, image: '');
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.brand);
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
    final res = await _repo.addBrand(
        nameController.text, imgCtr.text, encodedData.value);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.brand);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  //delete
  void delete(String id) async {
    final res = await _repo.deleteBrand(id: id);
    res.fold((failure) {
      Utils.snackBar('Brand Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Brand', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
    imgCtr.clear();
    encodedData.value = '';
  }

  TextEditingController imgCtr = TextEditingController(); // description

  var encodedData = ''.obs;
  // var pickedFileBytes = Rxn<Uint8List>();

  Future<void> pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      File file = File(result.files.single.path!);
      String uniqueImageName =
          'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      imgCtr.text = uniqueImageName;

      // Encode image data to base64
      List<int> imageBytes = await file.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      encodedData.value = base64Image;
      //print("Base64 Encoded Image Data: $base64Image");
    } else {
      // print("No image selected.");
    }
  }
}
