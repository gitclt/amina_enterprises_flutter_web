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
import 'package:flutter_svg/flutter_svg.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors
                          .transparent, // Make sure the background is clear
                      child: ClipOval(
                        child: SvgPicture.asset(
                          'assets/svg_icons/users.svg',
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                          colorFilter: const ColorFilter.mode(
                            Colors.red, // Change to any color
                            BlendMode
                                .srcIn, // Ensures the color replaces the SVG fill
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.06,
                        ),
                        Text(controller.codeController.text),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(controller.nameController.text)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.emailController.text),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(controller.mobileController.text)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    CircleAvatar(radius: 4, backgroundColor: AppColor.green),
                    SizedBox(
                      width: size.width * 0.003,
                    ),
                    Text(controller.activeStatus == "1" ? "Active" : "Inactive")
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
                      spacing: Responsive.isDesktop(context)
                          ? size.width * 0.03
                          : 50,
                      runSpacing: 20,
                      children: [
//                       DropDown3Widget(
//   width: size.width * 0.18,
//   label: "Monday",
//   hint: "",
//   selectedItem: controller.dropDownMonday,
//   items: controller.mondayList,
//   onChanged: (data) async {
//     if (data == null) {
//       controller.dropDownMonday = DropDownModel();
//       return;
//     }
//     controller.dropDownMonday = data;
//   },
// ),

                        DropDown3Widget(
                          width: size.width * 0.18,
                          label: 'Monday',
                          hint: '',
                          selectedItem: controller.dropDownMonday.id == null
                              ? null
                              : controller.dropDownMonday,
                          items: controller.mondayList,
                          validator: (value) {
                            if (value == null) {
                              return 'Select ';
                            }
                            return null;
                          },
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.dropDownMonday = data;
                          },
                        ),
                        DropDown3Widget(
                          width: size.width * 0.18,
                          label: 'Tuesday',
                          hint: '',
                          selectedItem: controller.dropDownTuesday.id == null
                              ? null
                              : controller.dropDownTuesday,
                          items: controller.tuesList,
                          validator: (value) {
                            if (value == null) {
                              return 'Select ';
                            }
                            return null;
                          },
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.dropDownTuesday = data;
                          },
                        ),

                        DropDown3Widget(
                          width: size.width * 0.18,
                          label: 'Wednesday',
                          hint: '',
                          selectedItem: controller.dropDownWednesday.id == null
                              ? null
                              : controller.dropDownWednesday,
                          items: controller.wednesList,
                          validator: (value) {
                            if (value == null) {
                              return 'Select ';
                            }
                            return null;
                          },
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.dropDownWednesday = data;
                          },
                        ),
                        DropDown3Widget(
                          width: size.width * 0.18,
                          label: 'Thursday',
                          hint: '',
                          selectedItem: controller.dropDownThursday.id == null
                              ? null
                              : controller.dropDownThursday,
                          items: controller.thusList,
                          validator: (value) {
                            if (value == null) {
                              return 'Select ';
                            }
                            return null;
                          },
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.dropDownThursday = data;
                          },
                        ),
                        DropDown3Widget(
                          width: size.width * 0.18,
                          label: 'Friday',
                          hint: '',
                          selectedItem: controller.dropDownFriday.id == null
                              ? null
                              : controller.dropDownFriday,
                          items: controller.friList,
                          validator: (value) {
                            if (value == null) {
                              return 'Select ';
                            }
                            return null;
                          },
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.dropDownFriday = data;
                          },
                        ),
                        DropDown3Widget(
                          width: size.width * 0.18,
                          label: 'Saturday',
                          hint: '',
                          selectedItem: controller.dropDownSaturday.id == null
                              ? null
                              : controller.dropDownSaturday,
                          items: controller.saturList,
                          validator: (value) {
                            if (value == null) {
                              return 'Select ';
                            }
                            return null;
                          },
                          onChanged: (data) async {
                            if (data == null) return;
                            controller.dropDownSaturday = data;
                          },
                        ),
                        //                   children: [
                        // ...List.generate(controller.daysOfWeek.length, (index) {
                        //   String day = controller.daysOfWeek[index];
                        //   return SizedBox(
                        //     width: size.width * 0.17,
                        //     child: DropDown3Widget(
                        //       width: size.width * 0.18,
                        //       label: day,
                        //       hint: '-- Select Route --',
                        //       selectedItem: controller.dropDownRoute ,
                        //       items: controller.routeDropList,
                        //       onChanged: (data) async {
                        //         if (data == null) return;
                        //         controller.dropDownRoute = data;

                        //         // Update route ID based on the selected day
                        //         switch (day) {
                        //           case "Monday":
                        //             controller.monRouteId.value = data.id.toString();
                        //             break;
                        //           case "Tuesday":
                        //             controller.tueRouteId.value = data.id.toString();
                        //             break;
                        //           case "Wednesday":
                        //             controller.wedRouteId.value = data.id.toString();
                        //             break;
                        //           case "Thursday":
                        //             controller.thuRouteId.value = data.id.toString();
                        //             break;
                        //           case "Friday":
                        //             controller.friRouteId.value = data.id.toString();
                        //             break;
                        //           case "Saturday":
                        //             controller.satRouteId.value = data.id.toString();
                        //             break;
                        //         }
                        //       },
                        //     ),
                        //   );
                        // }),

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
                                if (controller.editId == '') {
                                  controller.assignRoute();
                                } else {
                                  controller.assignRouteUpdate();
                                }
                              },
                              label:
                                  controller.editId == '' ? 'Submit' : 'Update',
                            ),
                          ],
                        ),
                      ]
                      // children: [
                      //   ...List.generate(controller.daysOfWeek.length, (index) {
                      //     String day = controller.daysOfWeek[index];
                      //     return SizedBox(
                      //       width: size.width * 0.17,
                      //       child: DropDown3Widget(
                      //         width: size.width * 0.18,
                      //         label: day,
                      //         // visible: true,
                      //         hint: "",
                      //         selectedItem: controller.dropDownRoute,
                      //         items: controller.routeDropList,
                      //         onChanged: (data) async {
                      //           if (data == null) return;
                      //           controller.dropDownRoute = data;

                      //           controller.mondayController.text =
                      //               data.id.toString();

                      //         },
                      //       ),
                      //     );
                      //   }),
                      //   Row(
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       CommonButton(
                      //         isLoading: controller.isLoading.value,
                      //         width: Responsive.isDesktop(context)
                      //             ? size.width * .1
                      //             : size.width * 0.25,
                      //         onClick: () {

                      //               controller.assignRoute();

                      //         },
                      //         label:
                      //             controller.editId == '' ? 'Submit' : 'Update',
                      //       ),
                      //     ],
                      //   ),
                      // ],
                      ),
                )),
          )
        ]),
      ),
    );
  }
}
