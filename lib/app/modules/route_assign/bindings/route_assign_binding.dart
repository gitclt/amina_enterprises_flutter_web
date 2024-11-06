import 'package:get/get.dart';

import '../controllers/route_assign_controller.dart';

class RouteAssignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouteAssignController>(
      () => RouteAssignController(),
    );
  }
}
