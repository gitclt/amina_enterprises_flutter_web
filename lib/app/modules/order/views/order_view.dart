import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/assign_route_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dates/select_date_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/general_exception.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/internet_exceptions_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/pagination/pagination_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/popup/common_popup.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/shimmer/table_loader.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_header_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_icons.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/add_new_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/core/extention.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.width * 0.008;
    return Scaffold(
        backgroundColor: AppColor.scaffoldBgColor,
        body: CommonPagePadding(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppBar(
            title: 'Home / Order / View',
            // onClick: () async {
            //   // controller.clear();
            // },
            label: 'add_new'.tr,
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
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: 15,
                      runSpacing: 15,
                      children: [
                        AddTextFieldWidget(
                          width: Responsive.isDesktop(context)
                              ? size.width * 0.18
                              : size.width * .32,
                          textController: controller.fromDateController,
                          label: 'From Date',
                          hintText: '',
                          visible: true,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today_outlined,
                                size: 20),
                            onPressed: () async {
                              selectDate(
                                  context, controller.fromDateController);
                            },
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Joining Date';
                            }
                            return null;
                          },
                        ),
                        AddTextFieldWidget(
                          width: Responsive.isDesktop(context)
                              ? size.width * 0.18
                              : size.width * .32,
                          textController: controller.toDateController,
                          label: 'To Date',
                          hintText: '',
                          visible: true,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today_outlined,
                                size: 20),
                            onPressed: () async {
                              selectDate(context, controller.toDateController);
                            },
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Joining Date';
                            }
                            return null;
                          },
                        ),
                        Obx(
                          () => DropDown3Widget(
                            width: size.width * 0.18,
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
                        Obx(
                          () => DropDown3Widget(
                            width: size.width * 0.18,
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
                        Tooltip(
                          message: "Search",
                          child: CommonButton(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width * .18
                                : null,
                            onClick: () {
                              if (controller.dropDownState.id != null) {
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
          ),
          SizedBox(
            height: size.height * 0.035,
          ),
          Obx(() {
            switch (controller.rxRequestStatus.value) {
              case Status.loading:
                return SizedBox(
                  height: size.height * 0.5,
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
                      controller.get();
                    },
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {
                    controller.get();
                  });
                }

              case Status.completed:
                return PageContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ColumnHeaderWidget(
                            width: size.width * 0.05,
                            label: 'Sl No.',
                          ),
                          ColumnHeaderWidget(
                            label: 'Order ID',
                            width: size.width * 0.07,
                          ),
                          ColumnHeaderWidget(
                            label: 'Cusromer Name',
                            width: size.width * 0.20,
                          ),
                          ColumnHeaderWidget(
                            label: 'Item Count',
                            width: size.width * 0.05,
                          ),
                          ColumnHeaderWidget(
                            label: 'Date',
                            width: size.width * 0.08,
                          ),
                          ColumnHeaderWidget(
                            label: 'District',
                            width: size.width * 0.08,
                          ),
                          ColumnHeaderWidget(
                            label: 'Location',
                            width: size.width * 0.08,
                          ),
                          ColumnHeaderWidget(
                            label: 'Status',
                            width: size.width * 0.08,
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
                          height: size.height * 0.25,
                          child: Obx(
                            () => ListView.builder(
                                itemCount: controller.data.length,
                                itemBuilder: (context, index) {
                                  const evenColor = Colors.white;
                                  const oddColor = AppColor.boxBorderColor;

                                  final bgColor =
                                      index % 2 == 0 ? oddColor : evenColor;
                                  final item = controller.data[index];
                                  controller.offset =
                                      (controller.currentPage.value - 1) *
                                          controller.pageSize;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ColumnWidget(
                                            text: columnText(
                                              "${controller.offset + index + 1}",
                                              fontSize,
                                            ),
                                            alignment: Alignment.center,
                                            width: size.width * 0.05,
                                            color: bgColor,
                                          ),
                                          ColumnWidget(
                                              text: columnText(
                                                  item.orderNumber ?? '',
                                                  fontSize),
                                              width: size.width * 0.07,
                                              alignment: Alignment.center,
                                              color: bgColor),
                                          ColumnWidget(
                                              text: columnText(
                                                  item.customer ?? '',
                                                  fontSize),
                                              width: size.width * 0.20,
                                              alignment: Alignment.center,
                                              color: bgColor),
                                          ColumnWidget(
                                              text: columnText(
                                                  item.itemCount.toString(),
                                                  fontSize),
                                              width: size.width * 0.05,
                                              alignment: Alignment.center,
                                              color: bgColor),
                                          ColumnWidget(
                                              text: columnText(
                                                  item.date.toString(),
                                                  fontSize),
                                              width: size.width * 0.08,
                                              alignment: Alignment.center,
                                              color: bgColor),
                                          ColumnWidget(
                                              text: columnText(
                                                  item.district ?? '',
                                                  fontSize),
                                              width: size.width * 0.08,
                                              alignment: Alignment.center,
                                              color: bgColor),
                                          ColumnWidget(
                                              text: columnText(
                                                  item.place ?? '', fontSize),
                                              width: size.width * 0.08,
                                              alignment: Alignment.center,
                                              color: bgColor),
                                          ColumnWidget(
                                              text: item.status == 'pending'
                                                  ? AssignRouteButton(
                                                      label: 'pending',
                                                      color: AppColor.red,
                                                      ontap: () {},
                                                    )
                                                  : AssignRouteButton(
                                                      label: 'Approved',
                                                      color: AppColor.green,
                                                      ontap: () {},
                                                    ),
                                              width: size.width * 0.08,
                                              alignment: Alignment.center,
                                              color: bgColor),
                                          Expanded(
                                            child: IconsColumnWidget(
                                              delete: () async {
                                                dynamic returnResponse =
                                                    await commonDialog(
                                                        title: "Delete",
                                                        subTitle:
                                                            "Are you sure want to delete this item?",
                                                        titleIcon: Icons.delete,
                                                        theamColor:
                                                            AppColor.red);

                                                if (returnResponse == true) {
                                                  // controller
                                                  //     .delete(item.id.toString());
                                                }
                                              },
                                              view: () async {
                                                await controller.getOrderDetail(
                                                    orderId:
                                                        item.id.toString());
                                                Get.rootDelegate
                                                    .toNamed(Routes.orderAdd);
                                                // controller.editClick(item);
                                              },
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
                          onPageSelected: controller.changePage))
                    ],
                  ),
                );
            }
          })
        ])));
  }
}
