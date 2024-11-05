import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/route_setting/controllers/route_setting_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteSettingAdd extends GetView<RouteSettingController> {
  const RouteSettingAdd({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: CommonPagePadding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppBar(
            title: 'Home / Route Settings / Add',
            onClick: () {
              Get.rootDelegate.toNamed(Routes.routeSetting);
            },
            label: 'view_all'.tr,
          ),
          const SizedBox(
            height: 20,
          ),
          PageContainer(
            child: Form(
              key: controller.formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => DropDown3Widget(
                            width: size.width * 0.23,
                            label: 'State',
                            hint: '--Select State--',
                            selectedItem: controller.dropDownState.id == null
                                ? null
                                : controller.dropDownState,
                            items: controller.stateDropList,
                            isLoading: controller.isStateLoading.value,
                            validator: (value) {
                              if (value == null) {
                                return 'Select State';
                              }
                              return null;
                            },
                            onChanged: (data) async {
                              if (data == null) return;
                              controller.dropDownState = data;
                              controller.getDistrict();
                            },
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.035,
                        ),
                        Obx(
                          () => DropDown3Widget(
                            width: size.width * 0.23,
                            label: 'District',
                            hint: '--Select District--',
                            selectedItem: controller.dropDownDistrict.id == null
                                ? null
                                : controller.dropDownDistrict,
                            items: controller.districtDropList,
                            isLoading: controller.isDisLoading.value,
                            validator: (value) {
                              if (value == null) {
                                return 'Select District';
                              }
                              return null;
                            },
                            onChanged: (data) async {
                              if (data == null) return;
                              controller.dropDownDistrict = data;
                            },
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.035,
                        ),
                        Tooltip(
                          message: "Search",
                          child: CommonButton(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width * .23
                                : null,
                            onClick: () {
                              if (controller.dropDownState.id != null) {
                                controller.get();
                              } else {
                                Utils.snackBar(
                                    'Route Setting', 'Please select a State');
                              }
                            },
                            label: "Search",
                          ),
                        ).paddingOnly(top: 28)
                      ],
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
