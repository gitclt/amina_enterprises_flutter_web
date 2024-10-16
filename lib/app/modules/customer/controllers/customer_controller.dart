import 'package:amina_enterprises_flutter_web/app/data/model/customer/customer_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/customer/customer_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
 final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = CustomerRepository();
  RxList<Customer> data = <Customer>[].obs;
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
    final res = await _repo.getCustomerList();
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
  void editClick(Customer data) async {
    nameController = TextEditingController(text: data.name);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.customerAdd);
  }

  edit() async {
    isLoading(true);
    final res = await _repo.updateCustomer(id: editId, name: nameController.text,
    address: '',
    branchId: '',
    designationId: '',
    dob: '',
    doj: '',
    email: '',
    isBde: '',
    location: '',
    macId: '',
    mobile: '',
    password: '',
    roleId: '',
    state: ''
    );
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.construction);
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
    final res = await _repo.addCustomer(
      name: '',
        address: '',
        branchId: '',
        designationId: '',
        dob: '',
        doj: '',
        email: '',
        isBde: '',
        location: '',
      macid: '',
        mobile: '',
        password: '',
        roleId: '',
        state: '');
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.construction);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  //delete
  void delete(String id) async {
    final res = await _repo.deleteCustomer(id: id);
    res.fold((failure) {
      Utils.snackBar('Construction Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Construction', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
  }
}
