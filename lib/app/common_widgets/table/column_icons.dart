import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconsColumnWidget extends StatelessWidget {
  final Color? color;
  final double? width;
  final VoidCallback? edit;
  final VoidCallback? view;
  final VoidCallback? delete;
  const IconsColumnWidget(
      {super.key, this.color, this.width, this.edit, this.delete, this.view});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: width,
      height: size.height * 0.053,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: AppColor.dividerColor, width: 1.0),
      ),
      child: Row(
        children: [
          if (view != null)
            InkWell(
              onTap: view,
              child: Container(
                width: Responsive.isDesktop(context)
                    ? size.width * .02
                    : size.width * 0.025,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    border: Border.all(color: AppColor.dividerColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Icon(
                    Icons.visibility,
                    // color: AppColor.white,
                    size: Responsive.isDesktop(context)
                        ? size.width * .009
                        : size.width * 0.015,
                  ),
                ),
              ),
            ),
          const SizedBox(
            width: 10,
          ),
          if (edit != null)
            InkWell(
              onTap: edit,
              child: Container(
                width: Responsive.isDesktop(context)
                    ? size.width * .02
                    : size.width * 0.025,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    border: Border.all(color: AppColor.dividerColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Icon(
                    Icons.edit,
                    // color: AppColor.white,
                    size: Responsive.isDesktop(context)
                        ? size.width * .009
                        : size.width * 0.015,
                  ),
                ),
              ).paddingOnly(left: 10),
            ),
          if (delete != null)
            InkWell(
              onTap: delete,
              child: Container(
                width: Responsive.isDesktop(context)
                    ? size.width * .02
                    : size.width * 0.03,
                height: size.width * 0.050,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    border: Border.all(color: AppColor.dividerColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.delete_outline_outlined,
                  // color: AppColor.white,
                  size: Responsive.isDesktop(context)
                      ? size.width * .009
                      : size.width * 0.015,
                ),
              ),
            )
        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final Color? color;
  final double? width;
  final IconData icon;
  final String tooltip;
  final VoidCallback? onClick;
  const IconWidget(
      {super.key,
      this.color,
      this.width,
      required this.icon,
      this.onClick,
      required this.tooltip});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.015,
      height: size.height * 0.03,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)
              //border: Border.all(color: AppColor.dividerColor, width: 1.0),
              ),
      child: Center(
        child: Tooltip(
          message: tooltip,
          child: InkWell(
            onTap: onClick,
            child: Icon(
              icon,
              size: 12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
