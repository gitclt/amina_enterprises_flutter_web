import 'package:amina_enterprises_flutter_web/app/common_widgets/popup/common_popup.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/popup/user/admin_popup.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/popup/user/change_password_popup.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';
import 'package:amina_enterprises_flutter_web/app/core/extention.dart';
import 'package:amina_enterprises_flutter_web/app/data/local/user_preference/user_prefrence_view_model.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CommonAppBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary,
      automaticallyImplyLeading: false,
      centerTitle: false,
      elevation: .2,
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "AMINA ENTERPRISES",
          )
        ],
      ),
      leading: ResponsiveWidget.isMobile(context)
          ? IconButton(
              onPressed: () {
                //if(scaffoldKey.currentState=null )
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: AppColor.white,
              ))
          : null,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
               // Get.rootDelegate.toNamed(Routes.notification);
              },
            ),
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: (_) {
                        return Stack(
                          children: [
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.04,
                              right: MediaQuery.of(context).size.width * 0,
                              child: AdminPopUp(onSelected: (value) async {
                                if (value == 'Profile') {
                                  //Get.rootDelegate.toNamed(Routes.profile);
                                } else if (value == 'Change Password') {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return const ChangePasswordPopUp();
                                      });
                                } else {
                                  dynamic returnResponse = await commonDialog(
                                      title: "logout",
                                      subTitle: "Are you sure want to logout?",
                                      titleIcon: Icons.logout);

                                  if (returnResponse == true) {
                                    UserPreference userPreference =
                                        UserPreference();
                                    userPreference.removeUser();

                                    Get.rootDelegate.offNamed(Routes.login);
                                  }
                                }
                              }),
                            ),
                          ],
                        );
                      });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle_rounded,
                      color: Colors.white,
                    ),
                    5.height,
                    Text(
                      LocalStorageKey.roleName.toUpperCase(),
                      style: TextStyle(color: AppColor.white, fontSize: 10),
                    ),
                  ],
                )),
          ],
        ).paddingOnly(right: 20)
        // IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        // IconButton(onPressed: () {}, icon: svgWidget(ImageAssets.appbarIcon))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
