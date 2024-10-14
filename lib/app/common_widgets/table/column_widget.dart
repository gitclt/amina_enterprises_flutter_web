import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';

class ColumnWidget extends StatelessWidget {
  final Widget text;
  final Alignment? alignment;
  final double? width;
  final Color? color;
  const ColumnWidget(
      {super.key,
      required this.text,
      this.width,
      this.color,
      this.alignment = Alignment.centerLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.053,
        decoration: BoxDecoration(
            color: color, border: Border.all(color: AppColor.grey, width: 1.0)),
        child: Align(alignment: alignment!, child: text)
            .paddingOnly(left: 5, right: 5));
  }
}

class ImageColumnWidget extends StatelessWidget {
  final String imgName;

  final double? width;
  final Color? color;
  const ImageColumnWidget(
      {super.key, required this.imgName, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.053,
        decoration: BoxDecoration(
            color: color, border: Border.all(color: AppColor.grey, width: 1.0)),
        child: Center(
          child: Image.network(
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.025,
            height: MediaQuery.of(context).size.height * 0.04,
            imgName,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              }
            },
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Center(
                child: Icon(
                  Icons.broken_image,
                  color: AppColor.red,
                ),
              );
            },
          ),
        ));
  }
}

class ColumnWidgetDelete extends StatelessWidget {
  final Color? color;

  final double? width;
  final Function? onTap;
  const ColumnWidgetDelete({super.key, this.color, this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: width ?? MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.052,
        decoration: BoxDecoration(
            color: color, border: Border.all(color: AppColor.grey, width: 1.0)),
        child: Center(
            child: InkWell(
          onTap: () {
            onTap!();
          },
          child: Container(
            width: size.width * 0.02,
            height: size.width * 0.02,
            decoration: BoxDecoration(
                color: AppColor.red, borderRadius: BorderRadius.circular(5)),
            child:
                svgWidget("assets/svg_icons/delete.svg", color: Colors.white),
          ),
        )));
  }
}

class ColumnWidgetwithNoBorder extends StatelessWidget {
  final Widget text;
  final double? width;
  final double? height;
  final Color? color;
  final bool? isBorder;
  final Alignment? alignment;
  const ColumnWidgetwithNoBorder(
      {super.key,
      required this.text,
      this.width,
      this.color,
      this.height,
      this.isBorder = true,
      this.alignment = Alignment.centerLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? MediaQuery.of(context).size.width * 0.1,
        height: height ?? MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: color ?? AppColor.grey.withOpacity(.2),
          border: isBorder == true
              ? Border(
                  bottom: BorderSide(color: AppColor.grey, width: 1.0),
                )
              : Border(
                  bottom: BorderSide(color: AppColor.white, width: 0.0),
                ),
        ),
        child: Align(
          alignment: alignment!,
          child: text,
        ).paddingOnly(left: 10, right: 5));
  }
}

class ColumnWidgeNoBorder extends StatelessWidget {
  final Widget text;

  final double? width;
  final Color? color;
  const ColumnWidgeNoBorder(
      {super.key, required this.text, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(
          child: text,
        ));
  }
}

class ColumnTextfieldWidget extends StatelessWidget {
  final double? width;
  final TextEditingController? textController;
  final bool? readOnly;
  final Color? color;
  final FormFieldValidator? validator;
  final bool? inputFormat;
  final int? maxLengthLimit;
  const ColumnTextfieldWidget(
      {super.key,
      this.width,
      this.color,
      this.textController,
      this.validator,
      this.readOnly = false,
      this.inputFormat,
      this.maxLengthLimit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.1,
      height: MediaQuery.of(context).size.height * 0.053,
      decoration: BoxDecoration(
          color: color, border: Border.all(color: AppColor.grey, width: 1.0)),
      child: TextFormField(
        controller: textController,
        validator: validator,
        readOnly: readOnly!,
        style: const TextStyle(fontSize: 14),
        inputFormatters: inputFormat == null
            ? null
            : [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(maxLengthLimit)
              ],
        decoration: InputDecoration(
          fillColor: AppColor.grey,
          contentPadding: const EdgeInsets.only(left: 33),
          hintStyle: const TextStyle(fontSize: 7),
          labelStyle: const TextStyle(fontSize: 7, color: Colors.grey),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColor.textGrayColor, width: .5),
            borderRadius: BorderRadius.circular(1),
          ),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColor.textGrayColor, width: .5),
            borderRadius: BorderRadius.circular(1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.matteBlue, width: .5),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ),
    );
  }
}

class ColumnWidgetAdd extends StatelessWidget {
  final Color? color;
  final double? width;
  final Function? onTapremove;
  final Function? onTapadd;
  final bool? isLoading;
  const ColumnWidgetAdd(
      {super.key,
      this.color,
      this.onTapremove,
      this.onTapadd,
      this.width,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: width ?? MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.052,
        decoration: BoxDecoration(
            color: color, border: Border.all(color: AppColor.grey, width: 1.0)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: isLoading == true
                  ? null
                  : () {
                      onTapadd!();
                    },
              child: Container(
                width: size.width * 0.05,
                height: size.width * 0.02,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onTapremove!();
              },
              child: const Icon(Icons.close),
            ).paddingOnly(left: 10),
          ],
        )).paddingOnly(left: 10));
  }
}
