import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_header.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';

class DashboardHeaderCard extends StatelessWidget {
  final String header;
  final String? subHeader;

  final List<Widget> child;
  const DashboardHeaderCard(
      {super.key, required this.header, required this.child, this.subHeader});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonHeader(
          title: header,
          subTitle: subHeader,
        ),
        Wrap(
          spacing: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width * 0.02
              : Responsive.isMobile(context)
                  ? 10
                  : 10,
          runSpacing: 15,
          children: child,
        ).paddingSymmetric(horizontal: 10, vertical: 20)
      ],
    );
  }
}

// class DashboardCard extends StatefulWidget {
//   final String lable;
//   final Function onTap;
//   final String count;
//   final Color color;
//   const DashboardCard(
//       {super.key,
//       required this.lable,
//       required this.onTap,
//       required this.count,
//       required this.color});

//   @override
//   State<DashboardCard> createState() => _DashboardCardState();
// }

// class _DashboardCardState extends State<DashboardCard> {
//   bool isHover = false;

//   @override
//   Widget build(BuildContext context) {
//     final width = Get.width * .47;
//     // final mobwidth = Get.width * .95;
//     return MouseRegion(
//       onHover: (v) {
//         isHover = true;
//         setState(() {});
//       },
//       onExit: (event) {
//         isHover = false;
//         setState(() {});
//       },
//       child: InkWell(
//         onTap: () {
//           widget.onTap();
//         },
//         child: Container(
//           width: width * .36,
//           height: width * .20,
//           decoration: BoxDecoration(
//               color: isHover ? widget.color : AppColor.white,
//               borderRadius: BorderRadius.circular(5),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Color(0x1F000000), // Shadow color
//                   offset: Offset(0, 0), // X, Y position
//                   blurRadius: 7, // Blur radius
//                   spreadRadius: 0,
//                 )
//               ]),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(5),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         widget.count,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: isHover ? AppColor.white : AppColor.primary,
//                         ),
//                       ),
//                     ),
//                     Icon(
//                       Icons.read_more,
//                       color: isHover ? AppColor.white : AppColor.primary,
//                       size: 40,
//                     ),
//                   ],
//                 ).paddingSymmetric(horizontal: 15, vertical: 15),
//                 // const SizedBox(
//                 //   height: 25,
//                 // ),
//                 Expanded(
//                     child: Container(
//                   width: double.infinity,
//                   color: widget.color,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         widget.lable,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: isHover ? AppColor.white : AppColor.white,
//                         ),
//                       ),
//                       // Icon(
//                       //   Icons.arrow_right,
//                       //   color: isHover ? AppColor.white : AppColor.primary,
//                       // ),
//                     ],
//                   ).paddingSymmetric(horizontal: 15),
//                 )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class DashboardCard extends StatefulWidget {
  final String lable;
  final Function onTap;
  final String count;
  final Color color;
  const DashboardCard(
      {super.key,
      required this.lable,
      required this.onTap,
      required this.count,
      required this.color});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
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
          width: width * .36,
          height: width * .20,
          decoration: BoxDecoration(
              color: isHover ? widget.color : AppColor.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1F000000), // Shadow color
                  offset: Offset(0, 0), // X, Y position
                  blurRadius: 7, // Blur radius
                  spreadRadius: 0,
                )
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.count,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isHover ? AppColor.white : AppColor.primary,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.read_more,
                      color: isHover ? AppColor.white : AppColor.primary,
                      size: 40,
                    ),
                  ],
                ).paddingSymmetric(horizontal: 15, vertical: 15),
                // const SizedBox(
                //   height: 25,
                // ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  color: widget.color,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.lable,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          color: isHover ? AppColor.white : AppColor.white,
                        ),
                      ),
                      // Icon(
                      //   Icons.arrow_right,
                      //   color: isHover ? AppColor.white : AppColor.primary,
                      // ),
                    ],
                  ).paddingSymmetric(horizontal: 15),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
