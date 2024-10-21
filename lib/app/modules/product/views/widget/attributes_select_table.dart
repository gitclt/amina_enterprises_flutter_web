import 'package:amina_enterprises_flutter_web/app/common_widgets/container/check_box_button.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/views/widget/active_status_button.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_header_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/table/column_widget.dart';

import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/borderless_textfeild.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ItemSelectTable extends StatelessWidget {
  const ItemSelectTable({
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
            width: size.width * 0.1,
            label: 'Select',
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
          Expanded(
              child: ColumnHeaderWidget(
            label: 'Status',
            width: size.width * 0.5,
          ))
        ],
      ),
      SingleChildScrollView(
        child: SizedBox(
          height: size.height * 0.17,
          child: ListView.builder(
              itemCount: controller.sizeList.length,
              itemBuilder: (context, index) {
                const evenColor = Colors.white;
                const oddColor = AppColor.boxBorderColor;

                final bgColor = index % 2 == 0 ? oddColor : evenColor;
                final item = controller.sizeList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ColumnWidget(
                          text: Obx(
                            () => CheckBoxButton(
                              selectItem: item.isSelect.value,
                              act: () {
                                item.isSelect.value = !item.isSelect.value;
                              },
                            ),
                          ),
                          alignment: Alignment.center,
                          width: size.width * 0.1,
                          color: bgColor,
                        ),
                        ColumnWidget(
                            text: columnText(item.size ?? '', fontSize),
                            width: size.width * 0.1,
                            alignment: Alignment.center,
                            color: bgColor),
                        ColumnWidget(
                            text: BorderlessTextfeild(
                                textController: item.mrpController),
                            width: size.width * 0.1,
                            alignment: Alignment.center,
                            color: bgColor),
                        ColumnWidget(
                            text: BorderlessTextfeild(
                                textController: item.stockController),
                            width: size.width * 0.1,
                            alignment: Alignment.center,
                            color: bgColor),
                        // Status radio buttons with individual Obx
                        Expanded(
                            child: ColumnWidget(
                                text: Row(
                                  children: [
                                    RadioBox(
                                      label: "Active",
                                      value: "Active",
                                      index: index,
                                      controller: controller,
                                    ),
                                    const SizedBox(height: 10),
                                    RadioBox(
                                      label: "Inactive",
                                      value: "Inactive",
                                      index: index,
                                      controller: controller,
                                    )
                                  ],
                                ),
                                width: size.width * 0.1,
                                alignment: Alignment.center,
                                color: bgColor)),
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    ]);
  }
}
