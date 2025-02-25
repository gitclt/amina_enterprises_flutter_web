import 'package:flutter/material.dart';

class AssignRouteButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback ontap;
  const AssignRouteButton({
    super.key,
    required this.color,
    required this.label,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        onTap: ontap,
        child: Container(
          // padding: EdgeInsets.symmetric(
          //     vertical: 12.0,
          //     horizontal:
          //         2.0), // Adjust padding as needed
          decoration: BoxDecoration(
            color: color, // Red background color
            borderRadius: BorderRadius.circular(
                4.0), // Makes the rectangle shape with slight rounding
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white, // Text color
                fontSize: 12.0, // Text size
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
