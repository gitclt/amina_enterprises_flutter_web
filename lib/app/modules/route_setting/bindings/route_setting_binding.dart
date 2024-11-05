import 'package:get/get.dart';

import '../controllers/route_setting_controller.dart';

class RouteSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouteSettingController>(
      () => RouteSettingController(),
    );
  }
}
