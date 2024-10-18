import 'package:amina_enterprises_flutter_web/app/constants/const_valus.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/employee/employee_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/employee/employee_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/employee/employee_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/designation/designation_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/district/distrct_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/division/division_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/settings_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/state/state_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  final rxRequestStatus = Status.completed.obs;
  RxBool isLoading = false.obs;
  RxBool isStateLoading = false.obs;
  RxBool isDisLoading = false.obs;
  RxBool isDivisionLoading = false.obs;
  RxString error = ''.obs;
  final _repo = EmployeeRepository();

  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController jDateController = TextEditingController();
  TextEditingController locController = TextEditingController();
  DropDownModel dropDownState = DropDownModel();
  DropDownModel dropDownDistrict = DropDownModel();
  DropDownModel dropDownRole = DropDownModel();
  DropDownModel dropDownDesignate = DropDownModel();
  DropDownModel dropDownStatus = DropDownModel();

  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> districtDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> designationDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> roleDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> statusDropList = <DropDownModel>[].obs;

// division

  RxList<DropDownModel> divisionDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> dropdownDivisionList = <DropDownModel>[].obs;

  final desigRepo = DesignationRepository();
  final divisionRepo = DivisionRepository();
  final stateRepo = StateRepository();
  final districtRepo = DistrictRepository();
  final roleRepo = SettingsRepository();

  String editId = '';
  final int pageSize = 10;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  int offset = 0;

  RxList<EmployeeData> data = <EmployeeData>[].obs;
  RxList<EmployeeData> dataCopy = <EmployeeData>[].obs;

  @override
  void onInit() {
    get();
    getState();
    getDesignation();
    getDivision();
    getRole();
    for (var st in AppConstValue().status) {
      statusDropList.add(DropDownModel(id: st.id, name: st.name));
    }
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getEmployeeList(pageSize, currentPage.value);
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        data.addAll(resData.data!);
        totalPages.value = resData.totalPages ?? 1;
      }
    });
  }

  getState() async {
    isStateLoading(true);
    stateDropList.clear();
    final res = await stateRepo.getList();
    res.fold((failure) {
      isStateLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isStateLoading(false);

      for (var state in resData.data!) {
        stateDropList
            .add(DropDownModel(id: state.id.toString(), name: state.name));
      }
    });
  }

  getDesignation() async {
    isStateLoading(true);
    designationDropList.clear();
    final res = await desigRepo.designationView();
    res.fold((failure) {
      isStateLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isStateLoading(false);

      for (var d in resData.data!) {
        designationDropList
            .add(DropDownModel(id: d.id.toString(), name: d.designation));
      }
    });
  }

  getDivision() async {
    isDisLoading(true);
    designationDropList.clear();
    final res = await divisionRepo.getList();
    res.fold((failure) {
      isDisLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isDisLoading(false);

      for (var d in resData.data!) {
        divisionDropList
            .add(DropDownModel(id: d.id.toString(), name: d.division));
      }
    });
  }

  getDistrict() async {
    isDisLoading(true);
    districtDropList.clear();
    final res = await districtRepo.getList(stateId: dropDownState.id);
    res.fold((failure) {
      isDisLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isDisLoading(false);

      for (var d in resData.data!) {
        districtDropList
            .add(DropDownModel(id: d.id.toString(), name: d.district));
      }
    });
  }

  getRole() async {
    isStateLoading(true);
    roleDropList.clear();
    final res = await roleRepo.getRoleList();
    res.fold((failure) {
      isStateLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isStateLoading(false);

      for (var d in resData.data!) {
        roleDropList.add(DropDownModel(id: d.id.toString(), name: d.name));
      }
    });
  }

  void changePage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page; // Update current page
      get(); // Fetch the employee list for the new page
    }
  }

  //edit
  void editClick(EmployeeData data) async {
    nameController = TextEditingController(text: data.name);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.customerAdd);
  }

  edit() async {
    isLoading(true);
    final res = await _repo.updateEmployee(
        id: editId,
        name: nameController.text,
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

  //add

  void add() async {
    isLoading(true);
    final res = await _repo.addEmployee(
      add: EmpAddModel(
          employee: Employee(
              name: nameController.text.trim(),
              code: codeController.text.trim(),
              districtId: dropDownDistrict.id ?? '',
              activeStatus: dropDownStatus.id ?? '',
              address: addressController.text.trim(),
              designationId: dropDownDesignate.id ?? '',
              joiningDate: Utils.dateConvert(jDateController.text.trim()),
              email: emailController.text.trim(),
              location: locController.text.trim(),
              mobile: mobileController.text.trim(),
              password: passwordController.text.trim(),
              roleId: dropDownRole.id ?? '',
              addedby: '1',
              stateId: dropDownState.id ?? ''),
          divisions: dropdownDivisionList
              .map((f) => Division(divisionId: f.id.toString()))
              .toList()),
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
          Get.rootDelegate.toNamed(Routes.employee);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  //delete
  void delete(String id) async {
    final res = await _repo.deleteEmployee(id: id);
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
