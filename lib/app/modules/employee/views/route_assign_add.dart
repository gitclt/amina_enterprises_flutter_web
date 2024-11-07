import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/employee/controllers/employee_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteAssignAdd extends GetView<EmployeeController> {
  const RouteAssignAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // var fontSize = size.width * 0.008;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: CommonPagePadding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppBar(
            title: 'Home / Route Assign / Add',
            onClick: () {
              Get.rootDelegate.toNamed(Routes.employee);
            },
            label: 'view_all'.tr,
          ),
          const SizedBox(
            height: 20,
          ),
          PageContainer(
            child: Column(
              children: [
                const Row(
                  children: [
                    CircleAvatar(),
                    Column(
                      children: [Text("code"), Text("name")],
                    ),
                    Column(
                      children: [Text("email"), Text("Phone")],
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    CircleAvatar(
                        radius: 4,
                        backgroundColor:
                            // item.activeStatus ==
                            //         "1"
                            // ?
                            AppColor.green
                        // : AppColor.grey,
                        ),
                    SizedBox(
                      width: size.width * 0.001,
                    ),
                    const Text(
                        // item.activeStatus == "1"
                        //     ?
                        "Active"
                        // : "Inactive",
                        )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          PageContainer(
            child: Obx(() => SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Wrap(
                    spacing:
                        Responsive.isDesktop(context) ? size.width * 0.03 : 50,
                    runSpacing: 20,
                    children: [
                      ...List.generate(controller.daysOfWeek.length, (index) {
                        String day = controller.daysOfWeek[index];
                        return SizedBox(
                          width: size.width * 0.17,
                          child: DropDown3Widget(
                            width: size.width * 0.18,
                            label: day,
                            // visible: true,
                            hint: "",
                            selectedItem: controller.dropDownRoute,
                            items: controller.routeDropList,
                            onChanged: (data) async {
                              if (data == null) return;
                              controller.dropDownRoute = data;

                              controller.mondayController.text =
                                  data.id.toString();

                              // print('${controller.mondayController.text}');
                            },
                          ),
                        );
                      }),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                            label:
                                controller.editId == '' ? 'Submit' : 'Update',
                          ),
                        ],
                      ),
                    ],
                  ),
                )),

           
          )
        ]),
      ),
    );
  }
}
