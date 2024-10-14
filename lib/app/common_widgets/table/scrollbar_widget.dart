import 'package:flutter/material.dart';

class ScrollbarWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  const ScrollbarWidget({super.key, required this.child, this.height});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final dataTableHorizontalScrollController = ScrollController();
    return Scrollbar(
      controller: dataTableHorizontalScrollController,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: dataTableHorizontalScrollController,
        child: SizedBox(
            height: height ?? size.height * 0.42,
            // width: dataTableWidth,
            child: child),
      ),
    );
  }
}
