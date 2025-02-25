import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/check_box_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/general_exception.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/internet_exceptions_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/pagination/pagination_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/shimmer/table_loader.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_header_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/core/extention.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/modules/route_setting/controllers/route_setting_controller.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabThree extends GetView<RouteSettingController> {
  const TabThree({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.width * 0.008;
    return PageContainer(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => DropDown3Widget(
                width: size.width * 0.15,
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
                width: size.width * 0.15,
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
                  controller.getPlace();
                },
              ),
            ),
            SizedBox(
              width: size.width * 0.035,
            ),
            Obx(
              () => DropDown3Widget(
                width: size.width * 0.15,
                label: 'Place',
                hint: '--Select Place--',
                selectedItem: controller.dropDownPlace.id == null
                    ? null
                    : controller.dropDownPlace,
                items: controller.placeDropList,
                isLoading: controller.isPlaceLoading.value,
                validator: (value) {
                  if (value == null) {
                    return 'Select Place';
                  }
                  return null;
                },
                onChanged: (data) async {
                  if (data == null) return;
                  controller.dropDownPlace = data;
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
                    ? MediaQuery.of(context).size.width * .15
                    : null,
                onClick: () {
                  if (controller.dropDownState.id != null) {
                    controller.getCustomer();
                  } else {
                    Utils.snackBar('Route Setting', 'Please select a State');
                  }
                },
                label: "Search",
              ),
            ).paddingOnly(top: 28)
          ],
        ),
        Obx(() {
          switch (controller.rxRequestStatus.value) {
            case Status.loading:
              return SizedBox(
                height: size.height * 0.3,
                child: ShimmerBuilder(
                  rowCount: 10,
                  sizes: [
                    size.width * 0.03,
                    size.width * 0.1,
                    size.width * 0.055,
                    size.width * 0.08,
                    size.width * 0.08,
                    size.width * 0.06,
                    size.width * 0.12,
                    size.width * 0.04,
                    size.width * 0.04,
                    size.width * 0.04,
                  ],
                ).paddingAll(10),
              );

            case Status.error:
              if (controller.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {
                    controller.getCustomer();
                  },
                );
              } else {
                return GeneralExceptionWidget(onPress: () {
                  controller.getCustomer();
                });
              }

            case Status.completed:
              return controller.customerdata.isEmpty
                  ? const SizedBox()
                  : PageContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.035,
                          ),
                          Row(
                            children: [
                              ColumnHeaderWidget(
                                width: size.width * 0.05,
                                label: 'Sl No.',
                              ),
                              ColumnHeaderWidget(
                                label: 'Shop Name',
                                width: size.width * 0.15,
                              ),
                              ColumnHeaderWidget(
                                label: 'Type',
                                width: size.width * 0.1,
                              ),
                              ColumnHeaderWidget(
                                label: 'Address',
                                width: size.width * 0.1,
                              ),
                              ColumnHeaderWidget(
                                label: 'Place',
                                width: size.width * 0.1,
                              ),
                              Expanded(
                                  child: ColumnHeaderWidget(
                                label: '',
                                width: size.width * 0.5,
                              ))
                            ],
                          ),
                          SingleChildScrollView(
                            child: SizedBox(
                              height: size.height * 0.1,
                              child: Obx(
                                () => ListView.builder(
                                    itemCount: controller.customerdata.length,
                                    itemBuilder: (context, index) {
                                      const evenColor = Colors.white;
                                      const oddColor = AppColor.boxBorderColor;

                                      final bgColor =
                                          index % 2 == 0 ? oddColor : evenColor;
                                      final item =
                                          controller.customerdata[index];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              ColumnWidget(
                                                text: columnText(
                                                  (index + 1).toString(),
                                                  fontSize,
                                                ),
                                                alignment: Alignment.center,
                                                width: size.width * 0.05,
                                                color: bgColor,
                                              ),
                                              ColumnWidget(
                                                  text: columnText(
                                                      item.name ?? '',
                                                      fontSize),
                                                  width: size.width * 0.15,
                                                  alignment: Alignment.center,
                                                  color: bgColor),
                                              ColumnWidget(
                                                  text: columnText(
                                                      item.customerType ?? '',
                                                      fontSize),
                                                  width: size.width * 0.1,
                                                  alignment: Alignment.center,
                                                  color: bgColor),
                                              ColumnWidget(
                                                  text: columnText(
                                                      item.address ?? '',
                                                      fontSize),
                                                  width: size.width * 0.1,
                                                  alignment: Alignment.center,
                                                  color: bgColor),
                                              ColumnWidget(
                                                  text: columnText(
                                                      item.place ?? '',
                                                      fontSize),
                                                  width: size.width * 0.1,
                                                  alignment: Alignment.center,
                                                  color: bgColor),
                                              Expanded(
                                                child: ColumnWidget(
                                                  text: Obx(
                                                    () => CheckBoxButton(
                                                      selectItem:
                                                          item.isSelect!.value,
                                                      act: () {
                                                        item.isSelect!.value =
                                                            !item.isSelect!
                                                                .value;
                                                      },
                                                    ),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: size.width * 0.1,
                                                  color: bgColor,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    }),
                              ),
                            ),
                          ),
                          10.height,
                          Obx(() => PaginationWidget(
                              totalPages: controller.totalPages.value,
                              currentPage: controller.currentPage.value,
                              onPageSelected: controller.changePage)),
                          CommonButton(
                            isLoading: controller.isLoading.value,
                            width: Responsive.isDesktop(context)
                                ? size.width * .1
                                : size.width * 0.25,
                            onClick: () {
                             
                                controller.addRoute();
                            
                            },
                            label:'Add' ,
                          )
                        ],
                      ),
                    );
          }
        })
      ]),
    );

//     return  CommonPagePadding(
//         child: Column(

//           children: [
//           PageContainer(
//             child: Form(
//               key: controller.formkey,
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Obx(
//                           () => DropDown3Widget(
//                             width: size.width * 0.23,
//                             label: 'State',
//                             hint: '--Select State--',
//                             selectedItem: controller.dropDownState.id == null
//                                 ? null
//                                 : controller.dropDownState,
//                             items: controller.stateDropList,
//                             isLoading: controller.isStateLoading.value,
//                             validator: (value) {
//                               if (value == null) {
//                                 return 'Select State';
//                               }
//                               return null;
//                             },
//                             onChanged: (data) async {
//                               if (data == null) return;
//                               controller.dropDownState = data;
//                               controller.getDistrict();
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           width: size.width * 0.035,
//                         ),
//                         Obx(
//                           () => DropDown3Widget(
//                             width: size.width * 0.23,
//                             label: 'District',
//                             hint: '--Select District--',
//                             selectedItem: controller.dropDownDistrict.id == null
//                                 ? null
//                                 : controller.dropDownDistrict,
//                             items: controller.districtDropList,
//                             isLoading: controller.isDisLoading.value,
//                             validator: (value) {
//                               if (value == null) {
//                                 return 'Select District';
//                               }
//                               return null;
//                             },
//                             onChanged: (data) async {
//                               if (data == null) return;
//                               controller.dropDownDistrict = data;
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           width: size.width * 0.035,
//                         ),
//                          Obx(
//                           () => DropDown3Widget(
//                             width: size.width * 0.23,
//                             label: 'District',
//                             hint: '--Select District--',
//                             selectedItem: controller.dropDownDistrict.id == null
//                                 ? null
//                                 : controller.dropDownDistrict,
//                             items: controller.districtDropList,
//                             isLoading: controller.isDisLoading.value,
//                             validator: (value) {
//                               if (value == null) {
//                                 return 'Select District';
//                               }
//                               return null;
//                             },
//                             onChanged: (data) async {
//                               if (data == null) return;
//                               controller.dropDownDistrict = data;
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           width: size.width * 0.035,
//                         ),
//                         Tooltip(
//                           message: "Search",
//                           child: CommonButton(
//                             width: Responsive.isDesktop(context)
//                                 ? MediaQuery.of(context).size.width * .23
//                                 : null,
//                             onClick: () {
//                               if (controller.dropDownState.id != null) {
//                                 controller.getCustomer();
//                               } else {
//                                 Utils.snackBar(
//                                     'Route Setting', 'Please select a State');
//                               }
//                             },
//                             label: "Search",
//                           ),
//                         ).paddingOnly(top: 28)
//                       ],
//                     ),
//                   ]),
//             ),
//           ),
//           SizedBox(
//             height: size.height * 0.035,
//           ),
//           Obx(() {
//             switch (controller.rxRequestStatus.value) {
//               case Status.loading:
//                 return SizedBox(
//                   height: size.height * 0.3,
//                   child: ShimmerBuilder(
//                     rowCount: 10,
//                     sizes: [
//                       size.width * 0.03,
//                       size.width * 0.1,
//                       size.width * 0.055,
//                       size.width * 0.08,
//                       size.width * 0.08,
//                       size.width * 0.06,
//                       size.width * 0.12,
//                       size.width * 0.04,
//                       size.width * 0.04,
//                       size.width * 0.04,
//                     ],
//                   ).paddingAll(10),
//                 );

//               case Status.error:
//                 if (controller.error.value == 'No internet') {
//                   return InterNetExceptionWidget(
//                     onPress: () {
//                       controller.getCustomer();
//                     },
//                   );
//                 } else {
//                   return GeneralExceptionWidget(onPress: () {
//                     controller.getCustomer();
//                   });
//                 }

//               case Status.completed:
//                 return controller.customerdata.isEmpty
//                     ? const SizedBox()
//                     : PageContainer(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             AddTextFieldWidget(
//                               width: Responsive.isDesktop(context)
//                                   ? size.width * 0.35
//                                   : size.width * .32,
//                               textController: controller.nameController,
//                               label: 'Route',
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Enter Route';
//                                 }
//                                 return null;
//                               },
//                             ).paddingOnly(left: 15),
//                             SizedBox(
//                               height: size.height * 0.035,
//                             ),
//                             Row(
//                               children: [
//                                 ColumnHeaderWidget(
//                                   width: size.width * 0.05,
//                                   label: 'Sl No.',
//                                 ),
//                                 ColumnHeaderWidget(
//                                   label: 'Shop Name',
//                                   width: size.width * 0.15,
//                                 ),
//                                 ColumnHeaderWidget(
//                                   label: 'Type',
//                                   width: size.width * 0.1,
//                                 ),
//                                 ColumnHeaderWidget(
//                                   label: 'Address',
//                                   width: size.width * 0.1,
//                                 ),
//                                 ColumnHeaderWidget(
//                                   label: 'Place',
//                                   width: size.width * 0.1,
//                                 ),
//                                 Expanded(
//                                     child: ColumnHeaderWidget(
//                                   label: '',
//                                   width: size.width * 0.5,
//                                 ))
//                               ],
//                             ),
//                             SingleChildScrollView(
//                               child: SizedBox(
//                                 height: size.height * 0.15,
//                                 child: Obx(
//                                   () => ListView.builder(
//                                       itemCount: controller.customerdata.length,
//                                       itemBuilder: (context, index) {
//                                         const evenColor = Colors.white;
//                                         const oddColor =
//                                             AppColor.boxBorderColor;

//                                         final bgColor = index % 2 == 0
//                                             ? oddColor
//                                             : evenColor;
//                                         final item =
//                                             controller.customerdata[index];
//                                         return Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 ColumnWidget(
//                                                   text: columnText(
//                                                     (index + 1).toString(),
//                                                     fontSize,
//                                                   ),
//                                                   alignment: Alignment.center,
//                                                   width: size.width * 0.05,
//                                                   color: bgColor,
//                                                 ),
//                                                 ColumnWidget(
//                                                     text: columnText(
//                                                         item.name ?? '',
//                                                         fontSize),
//                                                     width: size.width * 0.15,
//                                                     alignment: Alignment.center,
//                                                     color: bgColor),
//                                                 ColumnWidget(
//                                                     text: columnText(
//                                                         item.customerType ?? '',
//                                                         fontSize),
//                                                     width: size.width * 0.1,
//                                                     alignment: Alignment.center,
//                                                     color: bgColor),
//                                                 ColumnWidget(
//                                                     text: columnText(
//                                                         item.address ?? '',
//                                                         fontSize),
//                                                     width: size.width * 0.1,
//                                                     alignment: Alignment.center,
//                                                     color: bgColor),
//                                                 ColumnWidget(
//                                                     text: columnText(
//                                                         item.place ?? '',
//                                                         fontSize),
//                                                     width: size.width * 0.1,
//                                                     alignment: Alignment.center,
//                                                     color: bgColor),
//                                                 Expanded(
//                                                   child: ColumnWidget(
//                                                     text: Obx(
//                                                       () => CheckBoxButton(
//                                                         selectItem: item
//                                                             .isSelect!.value,
//                                                         act: () {
//                                                           item.isSelect!.value =
//                                                               !item.isSelect!
//                                                                   .value;
//                                                         },
//                                                       ),
//                                                     ),
//                                                     alignment: Alignment.center,
//                                                     width: size.width * 0.1,
//                                                     color: bgColor,
//                                                   ),
//                                                 )
//                                               ],
//                                             )
//                                           ],
//                                         );
//                                       }),
//                                 ),
//                               ),
//                             ),
//                             10.height,
//                             Obx(() => PaginationWidget(
//                                 totalPages: controller.totalPages.value,
//                                 currentPage: controller.currentPage.value,
//                                 onPageSelected: controller.changePage)),
//                             CommonButton(
//                               isLoading: controller.isLoading.value,
//                               width: Responsive.isDesktop(context)
//                                   ? size.width * .1
//                                   : size.width * 0.25,
//                               onClick: () {
//                                 if (controller.formkey.currentState!
//                                     .validate()) {
//                                   if (controller.editId == '') {
//                                     controller.addRoute();
//                                   } else {
//                                     // controller.editProduct();
//                                   }
//                                 }
//                               },
//                               label:
//                                   controller.editId == '' ? 'Create' : 'Update',
//                             )
//                           ],
//                         ),
//                       );
//             }
//           })
//         ]),

//     );
  }
}
