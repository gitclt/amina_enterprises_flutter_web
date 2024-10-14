// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';

// class CommonTextFormField extends StatelessWidget {
//   final String? label;

//   final TextEditingController? textEditingController;
//   final FormFieldValidator? validator;
//   final Function? onChanged;
//   final double? fontSize;
//   final double borderRadius;
//   final Color? fillColor;
//   final bool? readonly;
//   final bool? inputFormate;
//   final String? hintText;
//   final TextInputType? textInputType;
//   final Function? onTap;
//   final Widget? sufficxicon;
//   final String? labelText;
//   final int? maxLengthLimit;
//   const CommonTextFormField(
//       {super.key,
//       this.label,
//       this.textEditingController,
//       this.validator,
//       this.onChanged,
//       this.fontSize,
//       this.borderRadius = 8,
//       this.fillColor,
//       this.hintText,
//       this.sufficxicon,
//       this.labelText,
//       this.onTap,
//       this.readonly = false,
//       this.textInputType,
//       this.inputFormate,
//       this.maxLengthLimit});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: textEditingController,
//       validator: validator,
//       readOnly: readonly!,
//       onTap: onTap == null
//           ? null
//           : () {
//               onTap!();
//             },
//       onChanged: onChanged == null
//           ? null
//           : (String? value) {
//               onChanged!(value);
//             },
//       style: TextStyle(fontSize: fontSize ?? 14),
//       inputFormatters: inputFormate == null
//           ? null
//           : [
//               FilteringTextInputFormatter.digitsOnly,
//               LengthLimitingTextInputFormatter(maxLengthLimit)
//             ],
//       keyboardType: textInputType ?? TextInputType.text,
//       decoration: InputDecoration(
//           fillColor: fillColor ?? Colors.white,
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           hintStyle: const TextStyle(fontSize: 14),
//           labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
//           filled: true,
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColor.grey, width: .5),
//             borderRadius: BorderRadius.circular(borderRadius),
//           ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColor.grey, width: .5),
//             borderRadius: BorderRadius.circular(borderRadius),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColor.grey, width: .5),
//             borderRadius: BorderRadius.circular(borderRadius),
//           ),
//           hintText: hintText,
//           labelText: labelText,
//           suffixIcon: sufficxicon),
//     );
//   }
// }
