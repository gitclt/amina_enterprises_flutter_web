import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/modules/settings/district/controllers/district_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistrictAdd extends GetView<DistrictController> {
  const DistrictAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HomeAppBar(
          title: 'Home / Master / District / Add',
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
