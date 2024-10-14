import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';

class QtyTextfieldWidget extends StatelessWidget {
  final TextEditingController? textController;
  final FormFieldValidator? validator;
  final Function? onChanged;
  final double? fontSize;
  final double borderRadius;
  final double? height;
  final Color? fillColor;
  final Widget? suffixIcon;
  final TextInputType? keyboard;
  final bool? inputFormat;
  final int? maxLengthLimit;
  final String? hintText;
  final Function? onTap;
  final String? labelText;

  final bool? readonly;
  // final String? initialValue;
  final double? width;

  final int? minLines;

  const QtyTextfieldWidget({
    super.key,
    this.textController,
    this.validator,
    this.suffixIcon,
    this.readonly = false,
    this.keyboard,
    this.inputFormat,
    this.maxLengthLimit,
    this.onChanged,
    this.fontSize,
    this.borderRadius = 5,
    this.fillColor,
    this.hintText,
    this.onTap,
    this.labelText,
    this.height,
    this.width,
    this.minLines,
    // this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: Responsive.isDesktop(context)
                  ? size.width * 0.05
                  : size.width * .05,
              height: height,
              child: TextFormField(
                //  initialValue: initialValue,
                controller: textController,
                validator: validator,
                readOnly: readonly!,
                onTap: onTap == null
                    ? null
                    : () {
                        onTap!();
                      },
                onChanged: onChanged == null
                    ? null
                    : (String? value) {
                        onChanged!(value);
                      },
                style: TextStyle(fontSize: fontSize ?? 14),
                inputFormatters: inputFormat == null
                    ? null
                    : [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(maxLengthLimit)
                      ],
                keyboardType: keyboard ?? TextInputType.text,
                minLines: minLines,
                maxLines: minLines,
                decoration: InputDecoration(
                    fillColor: fillColor ?? Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    hintStyle: const TextStyle(fontSize: 12),
                    //  labelStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColor.textGrayColor, width: .5),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColor.textGrayColor, width: .5),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColor.textGrayColor, width: .5),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    hintText: hintText,
                    labelText: labelText,
                    suffixIcon: suffixIcon),
              ))
        ]);
  }
}
