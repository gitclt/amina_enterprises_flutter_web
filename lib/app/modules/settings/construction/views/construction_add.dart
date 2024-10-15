import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/modules/settings/construction/controllers/construction_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstructionAdd extends GetView<ConstructionController> {
  const ConstructionAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HomeAppBar(
          title: 'Home / Master / Construction / Add',
          onClick: () {
            Get.rootDelegate.toNamed(Routes.designation);
          },
          label: 'view_all'.tr,
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
