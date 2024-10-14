import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/core/assets/image_assets.dart';

import '../../../routes/app_pages.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return Scaffold(
          backgroundColor: AppColor.primary,
          body: Obx(
            () => (!controller.isLoading)
                ? (controller.isAuthenticated)
                    ? GetRouterOutlet(
                        initialRoute: Routes.home,
                      )
                    : GetRouterOutlet(
                        initialRoute: Routes.login,
                        // anchorRoute: '/',
                        // filterPages: (afterAnchor) {
                        //   return afterAnchor.take(1);
                        // },
                      )
                : _buildSplash(context),
          ),
        );
      },
    );
  }

  Widget _buildSplash(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageAssets.mainLogo,
            width: MediaQuery.of(context).size.width * .09,
            height: MediaQuery.of(context).size.width * .06,
          ),
          const SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            color: AppColor.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'LOADING....',
            style: TextStyle(
              fontSize: 18,
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
