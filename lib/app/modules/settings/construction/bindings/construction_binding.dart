import 'package:get/get.dart';

import '../controllers/construction_controller.dart';

class ConstructionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConstructionController>(
      () => ConstructionController(),
    );
  }
}
