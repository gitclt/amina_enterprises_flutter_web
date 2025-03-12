import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
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
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/core/extention.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/assign_route_button.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/employee_controller.dart';

class EmployeeView extends GetView<EmployeeController> {
  const EmployeeView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.width * 0.008;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: CommonPagePadding(
        child: Column(
          children: [
            HomeAppBar(
              title: 'Home / Employee / View',
              onClick: () async {
                controller.clear();

                Get.rootDelegate.toNamed(Routes.employeeAdd);
              },
              label: 'add_new'.tr,
            ),
            10.height,
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
                              label: 'Code',
                              width: size.width * 0.07,
                            ),
                            ColumnHeaderWidget(
                              label: 'Name',
                              width: size.width * 0.25,
                            ),
                            ColumnHeaderWidget(
                              label: 'Email',
                              width: size.width * 0.08,
                            ),
                            ColumnHeaderWidget(
                              label: 'Mobile',
                              width: size.width * 0.08,
                            ),
                            ColumnHeaderWidget(
                              label: 'Status',
                              width: size.width * 0.1,
                            ),
                            ColumnHeaderWidget(
                              label: '',
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
                            height: size.height * 0.5,
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
                                                    item.code ?? '', fontSize),
                                                width: size.width * 0.07,
                                                alignment: Alignment.center,
                                                color: bgColor),
                                            ColumnWidget(
                                                text: columnText(
                                                    item.name ?? '', fontSize),
                                                width: size.width * 0.25,
                                                alignment: Alignment.center,
                                                color: bgColor),
                                            ColumnWidget(
                                                text: columnText(
                                                    item.email ?? '', fontSize),
                                                width: size.width * 0.08,
                                                alignment: Alignment.center,
                                                color: bgColor),
                                            ColumnWidget(
                                                text: columnText(
                                                    item.mobile ?? '',
                                                    fontSize),
                                                width: size.width * 0.08,
                                                alignment: Alignment.center,
                                                color: bgColor),
                                            ColumnWidget(
                                                text: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: size.width * 0.01,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 2.5,
                                                      backgroundColor:
                                                          item.activeStatus ==
                                                                  "1"
                                                              ? AppColor.green
                                                              : AppColor.grey,
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.01,
                                                    ),
                                                    Text(
                                                      item.activeStatus == 1
                                                          ? "Active"
                                                          : "Inactive",
                                                    )
                                                  ],
                                                ),
                                                width: size.width * 0.1,
                                                alignment: Alignment.center,
                                                color: bgColor),
                                            ColumnWidget(
                                                text: item.route!.isEmpty
                                                    ? AssignRouteButton(
                                                        label: 'Assign Route',
                                                        color: AppColor.red,
                                                        ontap: () {
                                                          controller
                                                              .addRouteClick(
                                                                  item);
                                                        },
                                                      )
                                                    : AssignRouteButton(
                                                        label: 'Edit Route',
                                                        color: AppColor.green,
                                                        ontap: () {
                                                          controller
                                                              .editRouteClick(
                                                                  item);
                                                        },
                                                      ),
                                                width: size.width * 0.1,
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
                                                          titleIcon:
                                                              Icons.delete,
                                                          theamColor:
                                                              AppColor.red);

                                                  if (returnResponse == true) {
                                                    controller.delete(
                                                        item.id.toString());
                                                  }
                                                },
                                                edit: () async {
                                                  controller.editClick(item);
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
          ],
        ),
      ),
    );
  }
}
