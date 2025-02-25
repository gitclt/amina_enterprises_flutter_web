import 'package:amina_enterprises_flutter_web/app/constants/const_valus.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/order/order_detail_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/order/order_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/order/order_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/district/distrct_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/state/state_repository.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  final formkey = GlobalKey<FormState>();
  void setError(String value) => error.value = value;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  RxList<Order> data = <Order>[].obs;
   RxList<Details> orderDetailList = <Details>[].obs;
     DropDownModel dropDownStatus = DropDownModel();
     RxList<DropDownModel> statusDropList = <DropDownModel>[].obs;
  final _repo = OrderRepository();
  String editId = '';
  final int pageSize = 10;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  int offset = 0;

  @override
  void onInit() {
    getState();
    get();
     for (var st in AppConstValue().status) {
      statusDropList.add(DropDownModel(id: st.id, name: st.name));
    }
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getOrderList(pageSize, currentPage.value);
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


  void changePage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page; // Update current page
      get(); // Fetch the employee list for the new page
    }
  }

  Future getOrderDetail({required String orderId}) async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getOrderDetail(orderid: 
    
    orderId);
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
      orderDetailList.addAll(resData.data!);
      
      }
    });
  }

  //state and district
  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> districtDropList = <DropDownModel>[].obs;
  RxBool isStateLoading = false.obs;
  RxBool isDisLoading = false.obs;
  final stateRepo = StateRepository();
  final districtRepo = DistrictRepository();
  DropDownModel dropDownState = DropDownModel();
  DropDownModel dropDownDistrict = DropDownModel();
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


  // Current step index
  var currentStep = 0.obs;

  // Total number of steps
  final steps = [
    'Order Placed',
    'Order Approved',
    'Paused',
    'Start',
    'Delivered',
  ];

  // Method to go to the next step
  void goToNextStep() {
    if (currentStep < steps.length - 1) {
      currentStep++;
    }
  }

  // Method to go to the previous step
  void goToPreviousStep() {
    if (currentStep > 0) {
      currentStep--;
    }
  }
}
