import 'package:flutter/material.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/core/assets/image_assets.dart';

class ColumnHeaderWidget extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final bool? isfilter;
  final VoidCallback? callback;
  const ColumnHeaderWidget(
      {super.key,
      required this.label,
      this.width,
      this.height,
      this.isfilter,
      this.callback});

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * .007;
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.1,
      height: height ?? MediaQuery.of(context).size.height * 0.057,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.grey, width: 1.0)),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w800,
                color: AppColor.textGrayColor,
              ),
            ),
            if (callback != null)
              IconButton(
                onPressed: callback,
                icon: svgWidget(SvgAssets.sortIcon, size: 15),
              )
          ],
        ),
      ),
    );
  }
}

class ColumnHeaderWithSubColumnWidget extends StatelessWidget {
  final String label;
  final String label1;
  final String label2;
  final double? width;
  final double? width1;
  final double? height;
  const ColumnHeaderWithSubColumnWidget(
      {super.key,
      required this.label,
      this.width,
      required this.label1,
      required this.label2,
      this.height,
      this.width1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.1,
      height: height ?? MediaQuery.of(context).size.height * 0.065,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: width ?? MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.035,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColor.grey, width: 1.0)),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textGrayColor,
                  ),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width1 ?? MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.03,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.green, width: 1.0)),
                child: Center(
                  child: Text(
                    label1,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textGrayColor,
                    ),
                  ),
                ),
              ),
              Container(
                width: width1 ?? MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.03,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.grey, width: 1.0)),
                child: Center(
                  child: Text(
                    label2,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textGrayColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ColumnHeaderWithoutBorderWidget extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final bool? isfilter;
  final VoidCallback? callback;
  const ColumnHeaderWithoutBorderWidget(
      {super.key,
      required this.label,
      this.width,
      this.height,
      this.isfilter,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.1,
      height: height ?? MediaQuery.of(context).size.height * 0.05,
      decoration: const BoxDecoration(
        color: Color(0xffF2F2F2),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColor.textGrayColor,
              ),
            ),
            if (callback != null)
              IconButton(
                onPressed: callback,
                icon: Icon(
                  Icons.sort_by_alpha,
                  size: 20,
                  color: isfilter == null || isfilter == false
                      ? AppColor.black
                      : Colors.red,
                ),
              )
          ],
        ),
      ),
    );
  }
}
