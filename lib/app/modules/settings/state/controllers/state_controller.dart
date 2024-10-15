import 'package:amina_enterprises_flutter_web/app/data/model/settings/state/state_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/state/state_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateController extends GetxController {
   final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = StateRepository();
  RxList<StateData> data = <StateData>[].obs;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  RxBool isLoading = false.obs;
  String editId = '';
  
  @override
  void onInit() {
    super.onInit();
  }

 
}
