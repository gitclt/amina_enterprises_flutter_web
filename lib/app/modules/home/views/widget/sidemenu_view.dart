import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/core/assets/image_assets.dart';
import 'package:amina_enterprises_flutter_web/app/core/extention.dart';
import 'package:amina_enterprises_flutter_web/app/modules/home/controllers/sidemenu_state.dart';
import 'package:amina_enterprises_flutter_web/app/modules/home/views/widget/text_with_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidemenuView extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SidemenuView({super.key, required this.scaffoldKey});

  @override
  State<SidemenuView> createState() => _SidemenuViewState();
}

class _SidemenuViewState extends State<SidemenuView> {
  final controller = SidemenuState();
  @override
  void initState() {
    controller.addMenuItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.white,
      child: Column(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  ImageAssets.mainLogo,
                  width: MediaQuery.of(context).size.width * .1,
                  height: MediaQuery.of(context).size.width * .08,
                  color: AppColor.appointTextColor,
                ),
                //  whiteText('admin'.tr, fontSize: 14)
              ]),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => 5.height,
              itemCount: controller.menus.length,
              itemBuilder: (context, index) {
                final item = controller.menus[index];
                return Obx(() => SidemenuWidget(
                      isSelected: controller.selectedIndex.value == index
                          ? false
                          : true,
                      label: item.menu!,
                      iconData: item.icon,
                      svgIcon: item.svgIcon,
                      onClick: () {
                        controller.selectedIndex(index);
                        item.onClick!();
                      },
                    ));
              },
            ).paddingAll(5),
          )
        ],
      ),
    );
  }
}

divider() {
  return Divider(
    thickness: 1,
    color: AppColor.grey,
  );
}
