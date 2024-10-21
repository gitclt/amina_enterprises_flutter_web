import 'package:get/get.dart';

import '../controllers/size_controller.dart';

class SizeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SizeController>(
      () => SizeController(),
    );
  }
}
