import 'package:get/get.dart';

import '../controllers/district_controller.dart';

class DistrictBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DistrictController>(
      () => DistrictController(),
    );
  }
}
