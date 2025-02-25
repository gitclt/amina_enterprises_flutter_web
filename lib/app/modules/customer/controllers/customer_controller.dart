import 'package:amina_enterprises_flutter_web/app/constants/const_valus.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/customer/customer_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/customer/customer_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/customer/customer_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/district/distrct_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/division/division_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/place/place_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/state/state_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = CustomerRepository();
  final stateRepo = StateRepository();
  final districtRepo = DistrictRepository();
  final placeRepo = PlaceRepository();
  final divisionRepo = DivisionRepository();
  RxList<CustomerData> data = <CustomerData>[].obs;
  final formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController placeController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isStateLoading = false.obs;
  RxBool isDistrictLoading = false.obs;
  RxBool isPlaceLoading = false.obs;
  RxBool isDivisionLoading = false.obs;
  String editId = '';

//list
  DropDownModel sdSearchState = DropDownModel();
  DropDownModel sdSearchDistrict = DropDownModel();
  DropDownModel sdState = DropDownModel();
  DropDownModel sdDistrict = DropDownModel();
  DropDownModel sdPlace = DropDownModel();
  DropDownModel sdType = DropDownModel();
  // division

  RxList<DropDownModel> divisionDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> dropdownDivisionList = <DropDownModel>[].obs;

  RxList<DropDownModel> searchStateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> searchDistrictDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> typeDropList = <DropDownModel>[].obs;

  RxBool isSearchStateLoading = false.obs;
  RxBool isSearchDistrictLoading = false.obs;

  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> districtDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> placeDropList = <DropDownModel>[].obs;

  @override
  void onInit() {
    getState();

    get();
    getDivision();
    getSearchState();
    for (var v in AppConstValue().custemerTypes) {
      typeDropList.add(DropDownModel(id: v.id.toString(), name: v.name));
    }

    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  final int pageSize = 20;
  var currentPage = 1.obs;
  var totalPages = 1.obs;

  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getCustomerList(
      stateid: sdSearchState.id ?? '',
      districtId: sdSearchDistrict.id ?? '',
      placeId:'',
      routeId: '',
      page: currentPage.toString(),
      pageSize: pageSize.toString(),
    );
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        data.addAll(resData.data!);
        totalPages.value = (resData.totalCount! / pageSize).ceil();
      }
    });
  }

  void changePage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page; // Update current page
      get(); // Fetch the employee list for the new page
    }
  }

  void getSearchState() async {
    isSearchStateLoading(true);
    searchStateDropList.clear();
    final res = await stateRepo.getList();
    res.fold((failure) {
      isSearchStateLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isSearchStateLoading(false);

      for (var state in resData.data!) {
        searchStateDropList
            .add(DropDownModel(id: state.id.toString(), name: state.name));
      }
    });
  }

  void getSearchDistrict() async {
    isSearchDistrictLoading(true);
    sdSearchDistrict = DropDownModel(id: '', name: '--Select District--');
    searchDistrictDropList.clear();
    final res =
        await districtRepo.getList(stateId: sdSearchState.id.toString());
    res.fold((failure) {
      isSearchDistrictLoading(false);
      Utils.snackBar('Location', failure.message);
      setError(error.toString());
    }, (resData) {
      isSearchDistrictLoading(false);

      for (var p in resData.data!) {
        searchDistrictDropList
            .add(DropDownModel(id: p.id.toString(), name: p.district));
      }
    });
  }

// add view
  void getState() async {
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

  getDivision() async {
    isDivisionLoading(true);
    divisionDropList.clear();
    final res = await divisionRepo.getList();
    res.fold((failure) {
      isDivisionLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isDivisionLoading(false);

      for (var d in resData.data!) {
        divisionDropList
            .add(DropDownModel(id: d.id.toString(), name: d.division));
      }
    });
  }

  void getDistrict() async {
    isDistrictLoading(true);
    sdDistrict = DropDownModel(id: '', name: '--Select District--');
    districtDropList.clear();
    final res = await districtRepo.getList(stateId: sdState.id ?? '');
    res.fold((failure) {
      isDistrictLoading(false);
      Utils.snackBar('District', failure.message);
      setError(error.toString());
    }, (resData) {
      isDistrictLoading(false);

      for (var district in resData.data!) {
        districtDropList.add(
            DropDownModel(id: district.id.toString(), name: district.district));
      }
    });
  }

  void getPlace() async {
    isPlaceLoading(true);
    sdPlace = DropDownModel(id: '', name: '--Select Place--');
    placeDropList.clear();
    final res = await placeRepo.getList(
        stateId: sdState.id ?? '', districtId: sdDistrict.id ?? '');
    res.fold((failure) {
      isPlaceLoading(false);
      Utils.snackBar('Place', failure.message);
      setError(error.toString());
    }, (resData) {
      isPlaceLoading(false);

      for (var place in resData.data!) {
        placeDropList
            .add(DropDownModel(id: place.id.toString(), name: place.name));
      }
    });
  }

  //edit
  void editClick(CustomerData data) async {
    nameController = TextEditingController(text: data.name);
    codeController = TextEditingController(text: data.code);
    sdType = DropDownModel(id: data.customerType, name: data.customerType);
    passwordController = TextEditingController(text: data.password);
    emailController = TextEditingController(text: data.email);
    mobileController = TextEditingController(text: data.mobile);
    addressController = TextEditingController(text: data.address);
    // placeController = TextEditingController(text: data.place);
    //Controller = TextEditingController(text: data.name);
    pincodeController = TextEditingController(text: data.pincode.toString());
    sdState = DropDownModel(id: data.stateId.toString(), name: data.state);
    sdDistrict =
        DropDownModel(id: data.districtId.toString(), name: data.district);
        sdPlace =
        DropDownModel(id: data.place.toString(), name: data.place);
    if (data.divisions != null) {
      dropdownDivisionList(data.divisions!
          .map((v) =>
              DropDownModel(id: v.divisionId.toString(), name: v.divisionName))
          .toList());
    }
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.customerAdd);
  }

  edit() async {
    isLoading(true);
    final res = await _repo.updateCustomer(
        add: CustomerAddModel(
            customer: Customer(
              id: editId,
              name: nameController.text.trim(),
              code: codeController.text.trim(),
              customerType: sdType.id.toString(),
              password: passwordController.text.trim(),
              email: emailController.text.trim(),
              mobile: mobileController.text.trim(),
              address: addressController.text.trim(),
              placeId:sdPlace.id,
              districtId: int.tryParse('${sdDistrict.id}'),
              pincode: int.tryParse(pincodeController.text.trim()),
              stateId: int.tryParse('${sdState.id}'),
              createdEmpId: 1,
            ),
            divisions: dropdownDivisionList
                .map((f) => Division(
                      divisionId: int.tryParse('${f.id}'),
                    ))
                .toList()));

    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.customer);
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
        add: CustomerAddModel(
            customer: Customer(
                name: nameController.text.trim(),
                code: codeController.text.trim(),
                customerType: sdType.id.toString(),
                password: passwordController.text.trim(),
                email: emailController.text.trim(),
                mobile: mobileController.text.trim(),
                address: addressController.text.trim(),
                placeId:sdPlace.id,
                districtId: int.tryParse('${sdDistrict.id}'),
                pincode: int.tryParse(pincodeController.text.trim()),
                stateId: int.tryParse('${sdState.id}'),
                createdEmpId: 1),
            divisions: dropdownDivisionList
                .map((f) => Division(
                      divisionId: int.tryParse('${f.id}'),
                    ))
                .toList()));

    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.customer);
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
      Utils.snackBar('Customer Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Customer', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
    codeController.clear();
    sdType = DropDownModel(id: '', name: '--Select Type--');
    sdDistrict = DropDownModel(id: '', name: '--Select District--');
    sdState = DropDownModel(id: '', name: '--Select State--');
    sdPlace = DropDownModel(id: '', name: '--Select Type--');
    passwordController.clear();
    emailController.clear();
    mobileController.clear();
    addressController.clear();
    // placeController.clear();
    pincodeController.clear();
  }
}
