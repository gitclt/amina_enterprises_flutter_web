import 'package:get/get.dart';

import '../controllers/color_controller.dart';

class ColorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ColorController>(
      () => ColorController(),
    );
  }
}
