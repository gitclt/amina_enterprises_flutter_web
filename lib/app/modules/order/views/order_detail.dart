import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_home_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/button/common_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/container/simple_container.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/padding/common_padding.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/popup/common_popup.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_header_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_icons.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
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
    var fontSize = size.width * 0.008;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: Responsive.isDesktop(context)
                        ? size.width * 0.2
                        : Responsive.isMobile(context)
                            ? 50
                            : 50,
                    runSpacing: 20,
                    children: [
                      TittleText(
                        title: 'Order ID',
                        discription:
                            controller.orderDetailList.first.orderNumber ?? '',
                      ),
                      TittleText(
                        title: 'Customer name',
                        discription:
                            controller.orderDetailList.first.customer ?? '',
                      ),
                      TittleText(
                        title: 'Item Count',
                        discription: controller.orderDetailList.first.itemCount
                            .toString(),
                      ),
                      TittleText(
                        title: 'Date',
                        discription: controller.orderDetailList.first.date!,
                      ),
                      TittleText(
                        title: 'District',
                        discription: controller.orderDetailList.first.district!,
                      ),
                      TittleText(
                        title: 'Location',
                        discription:
                            controller.orderDetailList.first.placeId ?? '',
                      ),
                    ]).paddingOnly(bottom: 20),
                Column(
                  children: [
                    Row(
                      children: [
                        ColumnHeaderWidget(
                          width: size.width * 0.1,
                          label: 'Sl No.',
                        ),
                        ColumnHeaderWidget(
                          label: 'Name',
                          width: size.width * 0.15,
                        ),
                        ColumnHeaderWidget(
                          label: 'Quandity',
                          width: size.width * 0.15,
                        ),
                        ColumnHeaderWidget(
                          label: 'Amount',
                          width: size.width * 0.15,
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
                        height: size.height * 0.2,
                        child: Obx(
                          () => ListView.builder(
                              itemCount: controller.orderDetailList.length,
                              itemBuilder: (context, index) {
                                const evenColor = Colors.white;
                                const oddColor = AppColor.boxBorderColor;

                                final bgColor =
                                    index % 2 == 0 ? oddColor : evenColor;
                                final item = controller
                                    .orderDetailList.first.items![index];
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
                                                item.productName ?? '',
                                                fontSize),
                                            width: size.width * 0.15,
                                            alignment: Alignment.center,
                                            color: bgColor),
                                        ColumnWidget(
                                            text: columnText(
                                                item.qty.toString(), fontSize),
                                            width: size.width * 0.15,
                                            alignment: Alignment.center,
                                            color: bgColor),
                                        ColumnWidget(
                                            text: columnText(
                                                item.price.toString(),
                                                fontSize),
                                            width: size.width * 0.15,
                                            alignment: Alignment.center,
                                            color: bgColor),
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
                                                      theamColor: AppColor.red);

                                              if (returnResponse == true) {
                                                // controller
                                                //     .delete(item.id.toString());
                                              }
                                            },
                                            edit: () async {
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
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DropDown3Widget(
                      width: size.width * 0.18,
                      label: 'Status',
                      hint: '--Select Status--',
                      selectedItem: controller.dropDownStatus.id == null
                          ? null
                          : controller.dropDownStatus,
                      items: controller.statusDropList,
                      validator: (value) {
                        if (value == null) {
                          return 'Select Status';
                        }
                        return null;
                      },
                      onChanged: (data) async {
                        if (data == null) return;
                        controller.dropDownStatus = data;
                      },
                    ),
                  ],
                ),
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

class TittleText extends StatelessWidget {
  final String title, discription;
  const TittleText({
    super.key,
    required this.title,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          boldText(title, fontSize: 16),
          normalText(discription, 14, fontWeight: FontWeight.w400)
        ],
      ),
    );
  }
}
