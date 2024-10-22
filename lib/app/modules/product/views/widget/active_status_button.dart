import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:amina_enterprises_flutter_web/app/modules/product/controllers/product_controller.dart';

class RadioBox extends StatelessWidget {
  final String label;
  final String value;
  final int index; // Pass index to track status for the specific row
  final ProductController controller;

  const RadioBox({super.key, 
    required this.label,
    required this.value,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            controller.setStatus(
                index, value); // Set selected status based on the index
          },
          child: Row(
            children: [
              Icon(
                controller.statuses[index] == value
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: controller.statuses[index] == value
                    ? AppColor.primary
                    : Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color:
                      
                      Colors.black,
                ),
              ),
            ],
          ),
        ));
  }
}
