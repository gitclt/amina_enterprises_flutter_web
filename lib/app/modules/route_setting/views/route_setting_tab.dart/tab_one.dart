import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/modules/route_setting/controllers/route_setting_controller.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabOne extends GetView<RouteSettingController> {
  const TabOne({super.key});

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return CommonPagePadding(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        controller.addRouteName();
                      } else {
                         controller.editName();
                      }
                    }
                  },
                  label: controller.editId == '' ? 'Next' : 'Update',
                ).paddingOnly(right: 40),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
