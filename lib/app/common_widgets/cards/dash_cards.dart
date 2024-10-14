import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';

class DashCards extends StatefulWidget {
  final String lable;
  final Function onTap;
  const DashCards({super.key, required this.lable, required this.onTap});

  @override
  State<DashCards> createState() => _DashCardsState();
}

class _DashCardsState extends State<DashCards> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final width = Get.width * .47;
    // final mobwidth = Get.width * .95;
    return MouseRegion(
      onHover: (v) {
        isHover = true;
        setState(() {});
      },
      onExit: (event) {
        isHover = false;
        setState(() {});
      },
      child: InkWell(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          width: width * .35,
          height: width * .175,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isHover
                ? AppColor.primary.withOpacity(.5)
                : AppColor.scaffoldBgColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.read_more,
                color: isHover ? AppColor.white : AppColor.primary,
                size: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      widget.lable,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14,
                        color: isHover ? AppColor.white : AppColor.primary,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: isHover ? AppColor.white : AppColor.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
