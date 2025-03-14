import 'package:amina_enterprises_flutter_web/app/data/model/settings/designation/designation_list_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/designation/designation_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DesignationController extends GetxController {
   final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = DesignationRepository();
  RxList<DesignationData> data = <DesignationData>[].obs;
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
    final res = await _repo.designationView();
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
  void editClick(DesignationData data) async {
    nameController = TextEditingController(text: data.designation);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.designationAdd);
  }

  editDesignation() async {
    isLoading(true);
    final res =
        await _repo.editDesignation(id: editId, name: nameController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.designation);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  //add

  void addDesignation() async {
    isLoading(true);
    final res = await _repo.addDesignation(nameController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.designation);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  //delete
  void delete(String id) async {
    final res = await _repo.deleteDesignation(id: id);
    res.fold((failure) {
      Utils.snackBar('Designation Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Designation', resData.message!);
      get();
    });
  }

   clear() {
    editId = '';
    nameController.clear();
  }
}
