import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/order/controllers/order_controller.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetail extends GetView<OrderController> {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   // var fontSize = size.width * 0.008;
    return Scaffold(
        backgroundColor: AppColor.scaffoldBgColor,
        body: CommonPagePadding(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppBar(
            title: 'Home /  ',
            label: 'view_all'.tr,
          ),
          const SizedBox(
            height: 20,
          ),
          PageContainer(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonButton(
                      // isLoading: controller.isLoading.value,
                      width: Responsive.isDesktop(context)
                          ? size.width * .1
                          : size.width * 0.25,
                      onClick: () {
                        if (controller.formkey.currentState!.validate()) {
                          if (controller.editId == '') {
                            // controller.add();
                          } else {
                            // controller.edit();
                          }
                        }
                      },
                      label: 'Update',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ])));
  }
}
