import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/popup/common_popup.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_header_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_icons.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/route_setting/controllers/route_setting_controller.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabTwo extends GetView<RouteSettingController> {
  const TabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.width * 0.008;
    return Column(
      children: [
        CommonPagePadding(
          child: PageContainer(
            child: Column(
              children: [
                Row(
                  children: [
                    ColumnHeaderWidget(
                      width: size.width * 0.1,
                      label: 'Sl No.',
                    ),
                    ColumnHeaderWidget(
                      label: 'Shope Name',
                      width: size.width * 0.15,
                    ),
                    ColumnHeaderWidget(
                      label: 'Type',
                      width: size.width * 0.15,
                    ),
                    ColumnHeaderWidget(
                      label: 'Address',
                      width: size.width * 0.15,
                    ),
                    ColumnHeaderWidget(
                      label: 'Place',
                      width: size.width * 0.15,
                    ),
                    Expanded(
                      child: ColumnHeaderWidget(
                        label: '',
                        width: size.width * 0.5,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: size.height * 0.4,
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          const evenColor = Colors.white;
                          const oddColor = AppColor.boxBorderColor;

                          final bgColor = index % 2 == 0 ? oddColor : evenColor;
                          final item = controller.data.first.customers![index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ColumnWidget(
                                    text: columnText(
                                      (index + 1).toString(),
                                      fontSize,
                                    ),
                                    alignment: Alignment.center,
                                    width: size.width * 0.1,
                                    color: bgColor,
                                  ),
                                  ColumnWidget(
                                    text: columnText(
                                        item.customerName ?? '', fontSize),
                                    width: size.width * 0.15,
                                    alignment: Alignment.center,
                                    color: bgColor,
                                  ),
                                  ColumnWidget(
                                    text: columnText(
                                        item.customerType ?? '', fontSize),
                                    width: size.width * 0.15,
                                    alignment: Alignment.center,
                                    color: bgColor,
                                  ),
                                  ColumnWidget(
                                    text: columnText(
                                        item.address ?? '', fontSize),
                                    width: size.width * 0.15,
                                    alignment: Alignment.center,
                                    color: bgColor,
                                  ),
                                  ColumnWidget(
                                    text: columnText(
                                        item.customerName ?? '', fontSize),
                                    width: size.width * 0.15,
                                    alignment: Alignment.center,
                                    color: bgColor,
                                  ),
                                  Expanded(
                                    child: IconsColumnWidget(
                                      width: size.width * 0.5,
                                      delete: () async {
                                        dynamic returnResponse =
                                            await commonDialog(
                                          title: "Delete",
                                          subTitle:
                                              "Are you sure want to delete this item?",
                                          titleIcon: Icons.delete,
                                          theamColor: AppColor.red,
                                        );

                                        if (returnResponse == true) {
                                          // controller.delete(item.id.toString());
                                        }
                                      },
                                      edit: () async {
                                        // controller.editClick(item);
                                      },
                                      color: bgColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CommonButton(
                      isLoading: controller.isLoading.value,
                      width: Responsive.isDesktop(context)
                          ? size.width * .1
                          : size.width * 0.25,
                      onClick: () {
                        controller.get();
                        Get.rootDelegate.toNamed(Routes.routeSetting);
                        // controller.addRoute();
                      },
                      label: controller.editId == '' ? 'Finish' : 'Update',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
