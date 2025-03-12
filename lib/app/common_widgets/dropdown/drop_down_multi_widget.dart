import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/dropdown/drop_down3_widget.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text/text_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';

class DropDownMultiWidget extends StatelessWidget {
  final List<DropDownModel> items;
  final List<DropDownModel>? selectedItem;
  final String? label;
  final double? width;
  final bool isLoading;
  final bool isEnabled;
  final String? hint;
  final FormFieldValidator? validator;
  final Function(List<DropDownModel?>)? onChanged;
  // final Function(DropDownModel)? onRemoveItem;
  const DropDownMultiWidget({
    super.key,
    required this.items,
    this.selectedItem,
    this.onChanged,
    this.label,
    this.width,
    this.isLoading = false,
    this.isEnabled = true,
    this.hint,
    this.validator,
    // this.onRemoveItem
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          boldText(label ?? '',
              fontWeight: FontWeight.w600, color: AppColor.textGrayColor),
        if (label != null) const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              width: Responsive.isDesktop(context)
                  ? width ?? size.width * 0.73 / 2
                  : size.width * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                onTap: isEnabled ? null : () {},
                child: AbsorbPointer(
                  absorbing: !isEnabled,
                  child: DropdownSearch<DropDownModel>.multiSelection(
                    validator: validator,
                    items: items,
                    selectedItems: selectedItem ?? [],
                    onChanged: onChanged,
                    compareFn: (item, selectedItem) =>
                        item.name == selectedItem.name,
                    popupProps: PopupPropsMultiSelection.menu(
                      showSearchBox: true,
                      showSelectedItems: true,
                      searchDelay: Duration.zero,
                      itemBuilder: (context, item, isSelected) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.toString(), // Customize as per your item's display string
                            style: const TextStyle(
                                fontSize: 14), // Decrease font size here
                          ),
                        );
                      },
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        filled: true,
                        isDense: true,
                        fillColor: isEnabled
                            ? AppColor.white
                            : const Color.fromARGB(255, 246, 244, 244)
                                .withOpacity(0.3),
                        hintText: hint,
                        hintStyle: const TextStyle(fontSize: 12),
                        border: outlineInputBorder2,
                        errorBorder: outlineInputBorder2,
                        focusedBorder: outlineFocusedInputBorder2,
                        enabledBorder: outlineInputBorder2,
                      ),
                    ),

                    // dropdownBuilder: (context, selectedItems) {
                    //   return Wrap(
                    //     children: selectedItems.map((item) {
                    //       return Container(
                    //           padding: const EdgeInsets.all(4.0),
                    //           margin:
                    //               const EdgeInsets.symmetric(horizontal: 4.0),
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(12),
                    //             color: Colors.blueAccent.withOpacity(0.2),
                    //           ),
                    //           child: Row(
                    //             mainAxisSize: MainAxisSize.min,
                    //             children: [
                    //               Text(
                    //                 item.name!, // Customize as per your item's display string
                    //                 style: const TextStyle(
                    //                     fontSize:
                    //                         12), // Decrease font size here
                    //               ),
                    //               const SizedBox(width: 4),
                    //               GestureDetector(
                    //                 onTap: () {
                    //                   if (onRemoveItem != null) {
                    //                   onRemoveItem!(item); // Call the removal callback
                    //                 }

                    //                 },
                    //                 child: const Icon(
                    //                   Icons.close,
                    //                   size: 14,
                    //                 ),
                    //               ),
                    //             ],
                    //           ));
                    //     }).toList(),
                    //   );
                    // },
                  ),
                ),
              ),
            ),
            if (isLoading)
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    color: Colors.white,
                    width: 24,
                    height: 24,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
