import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/text_form_field.dart/underline_textformfield.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';

class TableSerchBar extends StatelessWidget {
  final Function(String)? onSearchChanged;
  final VoidCallback? onTapExcelDown;
  final VoidCallback? onTapPdfDown;
  const TableSerchBar(
      {super.key,
      required this.size,
      this.onSearchChanged,
      this.onTapExcelDown,
      this.onTapPdfDown});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Show : ",
            style: TextStyle(
                color: Color(0xff666666),
                fontWeight: FontWeight.w400,
                fontSize: 12)),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColor.textGrayColor,
              ),
            ),
            height: size.height * 0.035,
            width: size.width * 0.06,
            child: DropdownButton<String>(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              underline: const SizedBox(),
              isDense: true,
              hint: const Text(
                "100",
              ),
              isExpanded: true,
              items: <String>[
                '10',
                '50',
                '100',
                'All',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
              onChanged: (_) {},
            )),
        const Text("Entries",
                style: TextStyle(
                    color: Color(0xff666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 12))
            .paddingOnly(left: 5),
        const Spacer(),
        const Text("Search : ",
            style: TextStyle(
                color: Color(0xff666666),
                fontWeight: FontWeight.w400,
                fontSize: 12)),
        SizedBox(
            height: size.height * 0.045,
            width: size.width * 0.125,
            child: CommonTextField(
              hintText: "",
              borderRadius: 5,
              onChanged: onSearchChanged,
            ))
      ],
    );
  }
}
