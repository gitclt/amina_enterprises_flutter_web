import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/settings/route/controllers/route_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RouteAdd extends GetView<RouteController> {
  const RouteAdd({super.key});

 @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: CommonPagePadding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppBar(
            title: 'Home / Master / Route / Add',
            onClick: () {
              Get.rootDelegate.toNamed(Routes.route);
            },
            label: 'view_all'.tr,
          ),
          const SizedBox(
            height: 20,
          ),
          PageContainer(
            child: Form(
              key: controller.formkey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AddTextFieldWidget(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.35
                        : size.width * .32,
                    textController: controller.nameController,
                    label: 'Route Name',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Route Name';
                      }
                      return null;
                    },
                  ).paddingOnly(left: 15),
                  SizedBox(
                    width: size.width * 0.035,
                  ),
                  CommonButton(
                    isLoading: controller.isLoading.value,
                    width: Responsive.isDesktop(context)
                        ? size.width * .1
                        : size.width * 0.25,
                    onClick: () {
                      if (controller.formkey.currentState!.validate()) {
                        if (controller.editId == '') {
                          controller.add();
                        } else {
                          controller.edit();
                        }
                      }
                    },
                    label: controller.editId == '' ? 'Create' : 'Update',
                  ).paddingOnly(right: 40),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
