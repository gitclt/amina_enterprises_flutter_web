import 'package:get/get.dart';

import '../controllers/designation_controller.dart';

class DesignationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DesignationController>(
      () => DesignationController(),
    );
  }
}
