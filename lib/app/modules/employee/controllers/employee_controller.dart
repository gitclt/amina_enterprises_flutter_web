import 'package:amina_enterprises_flutter_web/app/constants/const_valus.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/employee/employee_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/employee/employee_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/employee/employee_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/route_settings/route_setting_repository.dart';
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
  RxBool isRouteLoading = false.obs;
  RxBool isDisLoading = false.obs;
  RxBool isDivisionLoading = false.obs;
  RxString error = ''.obs;
  final _repo = EmployeeRepository();
  final routerepo = RouteSettingRepository();


  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController jDateController = TextEditingController();
  TextEditingController locController = TextEditingController();
  TextEditingController mondayController = TextEditingController();
  TextEditingController tuesdayController = TextEditingController();
  TextEditingController wednesday = TextEditingController();
  TextEditingController thursdayController = TextEditingController();
  TextEditingController fridayController = TextEditingController();
  TextEditingController saturday = TextEditingController();
  TextEditingController sundayController = TextEditingController();
  DropDownModel dropDownState = DropDownModel();
  DropDownModel dropDownDistrict = DropDownModel();
  DropDownModel dropDownRole = DropDownModel();
  DropDownModel dropDownDesignate = DropDownModel();
  DropDownModel dropDownStatus = DropDownModel();
  DropDownModel dropDownRoute = DropDownModel();

  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> districtDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> designationDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> roleDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> statusDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> routeDropList = <DropDownModel>[].obs;

  List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  DropDownModel dropDownMonday = DropDownModel();
  DropDownModel dropDownTuesday = DropDownModel();
  DropDownModel dropDownWednesday = DropDownModel();
  DropDownModel dropDownThursday = DropDownModel();
  DropDownModel dropDownFriday = DropDownModel();
  DropDownModel dropDownSaturday = DropDownModel();

// List to hold the dropdown options for each day
  RxList<DropDownModel> mondayList = <DropDownModel>[].obs;
  RxList<DropDownModel> tuesList = <DropDownModel>[].obs;
   RxList<DropDownModel> wednesList = <DropDownModel>[].obs;
  RxList<DropDownModel> thusList = <DropDownModel>[].obs;
   RxList<DropDownModel> friList = <DropDownModel>[].obs;
  RxList<DropDownModel> saturList = <DropDownModel>[].obs;


// division

  RxList<DropDownModel> divisionDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> dropdownDivisionList = <DropDownModel>[].obs;

  final desigRepo = DesignationRepository();
  final divisionRepo = DivisionRepository();
  final stateRepo = StateRepository();
  final districtRepo = DistrictRepository();
  final roleRepo = SettingsRepository();

  String editId = '';
    String empId = '';
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
    getRoute();
    for (var st in AppConstValue().status) {
      statusDropList.add(DropDownModel(id: st.id, name: st.name));
    }

    super.onInit();
  }

  getRoute() async {
    isRouteLoading(true);
    routeDropList.clear();
    final res = await routerepo.getList(rootid: '');
    res.fold((failure) {
      isRouteLoading(false);
      Utils.snackBar('Route', failure.message);
      setError(error.toString());
    }, (resData) {
      isRouteLoading(false);

      for (var route in resData.data!) {
        routeDropList.add(
            DropDownModel(id: route.rootId.toString(), name: route.rootName));
        mondayList.add(
            DropDownModel(id: route.rootId.toString(), name: route.rootName));
        tuesList.add( DropDownModel(id: route.rootId.toString(), name: route.rootName));
         wednesList.add(
            DropDownModel(id: route.rootId.toString(), name: route.rootName));
             thusList.add(
            DropDownModel(id: route.rootId.toString(), name: route.rootName));
        friList.add(
            DropDownModel(id: route.rootId.toString(), name: route.rootName));
        saturList.add(
            DropDownModel(id: route.rootId.toString(), name: route.rootName));
       
      }
    });
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
        totalPages.value = (resData.totalPages ?? 1 / pageSize).ceil();
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
    codeController = TextEditingController(text: data.code);

    dropDownDesignate = DropDownModel(
        id: data.designationId.toString(), name: data.designation);
    emailController = TextEditingController(text: data.email);
    mobileController = TextEditingController(text: data.mobile);
    addressController = TextEditingController(text: data.address);
    passwordController = TextEditingController(text: data.password);
    dropDownState =
        DropDownModel(id: data.stateId.toString(), name: data.state);
    dropDownDistrict =
        DropDownModel(id: data.districtId.toString(), name: data.district);
    locController = TextEditingController(text: data.location);
    dropDownRole = DropDownModel(id: data.roleId.toString(), name: data.role);

    if (data.joiningDate != null) {
      jDateController = TextEditingController(
          //  text: DateFormat('dd-MM-yyyy').format(data.joiningDate)
          );
    }

    dropDownStatus = DropDownModel(
        id: data.activeStatus.toString(),
        name: data.activeStatus == '0' ? "Inactive" : "Active");

    if (data.divisions != null) {
      dropdownDivisionList(data.divisions!
          .map((v) =>
              DropDownModel(id: v.divisionId.toString(), name: v.divisionName))
          .toList());
    }

    editId = data.id.toString();

    Get.rootDelegate.toNamed(Routes.employeeAdd);
  }

  void edit() async {
    isLoading(true);
    final res = await _repo.updateEmployee(
        update: EmpAddModel(
            employee: Employee(
                id: editId,
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
                .toList()));
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        clear();
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
  void addRouteClick(EmployeeData data) async {
    empId = data.id.toString();
    nameController = TextEditingController(text: data.name);
    codeController = TextEditingController(text: data.code);
    emailController = TextEditingController(text: data.email);
    mobileController = TextEditingController(text: data.mobile);
    
    getRoute();
    Get.rootDelegate.toNamed(Routes.routeAssignAdd);
  }
  //edit
  void editRouteClick(EmployeeData data) async {
    editId = data.id.toString();
    nameController = TextEditingController(text: data.name);
    codeController = TextEditingController(text: data.code);
    emailController = TextEditingController(text: data.email);
    mobileController = TextEditingController(text: data.mobile);
    dropDownMonday = DropDownModel(
        id: data.route!.first.monRouteId?.toString() ?? '',
        name: data.route!.first.monRouteName?.toString() ?? '');
    dropDownTuesday = DropDownModel(
        id: data.route!.first.tueRouteId?.toString() ?? '',
        name: data.route!.first.tueRouteName?.toString() ?? '');
    dropDownWednesday = DropDownModel(
        id: data.route!.first.wedRouteId?.toString() ?? '',
        name: data.route!.first.wedRouteName?.toString() ?? '');
    dropDownThursday = DropDownModel(
        id: data.route!.first.thuRouteId?.toString() ?? '',
        name: data.route!.first.thuRouteName?.toString() ?? '');
    dropDownFriday = DropDownModel(
        id: data.route!.first.friRouteId?.toString() ?? '',
        name: data.route!.first.friRouteName?.toString() ?? '');
    dropDownSaturday = DropDownModel(
        id: data.route!.first.satRouteId?.toString() ?? '',
        name: data.route!.first.satRouteName?.toString() ?? '');

    getRoute();
    Get.rootDelegate.toNamed(Routes.routeAssignAdd);
  }

void assignRouteUpdate() async {
    isLoading(true);
    final res = await _repo.assignRouteUpdate(
      // editId: editId,
      empId: editId,
      monRouteId: dropDownMonday.id,
      tueRouteId: dropDownTuesday.id,
      wedRouteId: dropDownWednesday.id,
      thuRouteId: dropDownThursday.id,
      friRouteId: dropDownFriday.id,
      satRouteId: dropDownSaturday.id,
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
          Utils.snackBar('Success', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  void assignRoute() async {
    isLoading(true);
    final res = await _repo.assignRoute(
      empId: empId,
      monRouteId: dropDownMonday.id,
      tueRouteId: dropDownTuesday.id,
      wedRouteId: dropDownWednesday.id,
      thuRouteId: dropDownThursday.id,
      friRouteId: dropDownFriday.id,
      satRouteId: dropDownSaturday.id,
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
          Utils.snackBar('Success', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }
  // void editRoute() async {

  // }
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

          clear();
        }
      },
    );
  }

  //delete
  void delete(String id) async {
    final res = await _repo.deleteEmployee(id: id);
    res.fold((failure) {
      Utils.snackBar('Employee Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Employeee', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
    codeController.clear();
    emailController.clear();
    mobileController.clear();
    passwordController.clear();
    addressController.clear();
    jDateController.clear();
    locController.clear();
    dropDownDesignate = DropDownModel();
    dropDownState = DropDownModel();
    dropDownDistrict = DropDownModel();
    dropDownRole = DropDownModel();
    dropDownStatus = DropDownModel();
    dropdownDivisionList.clear();
  }
}
