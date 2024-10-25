import 'package:amina_enterprises_flutter_web/app/common_widgets/popup/common_popup.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_header_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_icons.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_widget.dart';

import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/controllers/product_controller.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/pro_item_edit_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AttributesTable extends StatelessWidget {
  const AttributesTable({
    super.key,
    required this.controller,
  });

  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.width * 0.008;
    return Column(children: [
      Row(
        children: [
          ColumnHeaderWidget(
            width: size.width * 0.05,
            label: 'Sl No.',
          ),
          ColumnHeaderWidget(
            label: 'Sub Category',
            width: size.width * 0.1,
          ),
          ColumnHeaderWidget(
            label: 'Color',
            width: size.width * 0.1,
          ),
          ColumnHeaderWidget(
            label: 'Size',
            width: size.width * 0.1,
          ),
          ColumnHeaderWidget(
            label: 'MRP',
            width: size.width * 0.1,
          ),
          ColumnHeaderWidget(
            label: 'Stock',
            width: size.width * 0.1,
          ),
          ColumnHeaderWidget(
            label: 'Status',
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
                itemCount: controller.detailList.length,
                itemBuilder: (context, index) {
                  const evenColor = Colors.white;
                  const oddColor = AppColor.boxBorderColor;

                  final bgColor = index % 2 == 0 ? oddColor : evenColor;
                  final item = controller.detailList[index];
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
                            width: size.width * 0.05,
                            color: bgColor,
                          ),
                          ColumnWidget(
                              text:
                                  columnText(item.subcategory ?? '', fontSize),
                              width: size.width * 0.1,
                              alignment: Alignment.center,
                              color: bgColor),
                          ColumnWidget(
                              text: columnText(item.color ?? '', fontSize),
                              width: size.width * 0.1,
                              alignment: Alignment.center,
                              color: bgColor),
                          ColumnWidget(
                              text: columnText(item.size ?? '', fontSize),
                              width: size.width * 0.1,
                              alignment: Alignment.center,
                              color: bgColor),
                          ColumnWidget(
                              text: columnText(item.mrp.toString(), fontSize),
                              width: size.width * 0.1,
                              alignment: Alignment.center,
                              color: bgColor),
                          ColumnWidget(
                              text: columnText(item.stock.toString(), fontSize),
                              width: size.width * 0.1,
                              alignment: Alignment.center,
                              color: bgColor),
                          ColumnWidget(
                              text: columnText(item.status ?? '', fontSize),
                              width: size.width * 0.1,
                              alignment: Alignment.center,
                              color: bgColor),
                          Expanded(
                            child: IconsColumnWidget(
                              width: size.width * 0.5,
                              delete: () async {
                                dynamic returnResponse = await commonDialog(
                                    title: "Delete",
                                    subTitle:
                                        "Are you sure want to delete this item?",
                                    titleIcon: Icons.delete,
                                    theamColor: AppColor.red);

                                if (returnResponse == true) {
                                  controller
                                      .deleteProductItem(item.id.toString());
                                }
                              },
                              edit: () async {
                                await controller.editIteamClick(item);
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return ProductEditPopup(
                                        onChange: () {},
                                        controller: controller,
                                      );
                                    });
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
    ]);
  }
}
