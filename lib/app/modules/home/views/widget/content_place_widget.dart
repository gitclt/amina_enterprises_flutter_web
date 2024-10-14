import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';

class ContentPlaceWidget extends StatelessWidget {
  const ContentPlaceWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(builder: (context, delegate, currentRoute) {
      //This router outlet handles the appbar and the bottom navigation bar
      // final currentLocation = currentRoute?.location;
      // var currentIndex = 0;
      // if (currentLocation?.startsWith(Routes.settings) == true) {
      //   currentIndex = 3;
      // }
      // if (currentLocation?.startsWith(Routes.profile) == true) {
      //   currentIndex = 1;
      // }
      // if (currentLocation?.startsWith(Routes.home) == true) {
      //   currentIndex = 2;
      // }

      return Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: AppColor.scaffoldBgColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GetRouterOutlet(
            initialRoute: Routes.dashboard,
            // anchorRoute: Routes.HOME,
            key: Get.nestedKey(Routes.home),
          ),
        ),
      );
    });
  }
}
