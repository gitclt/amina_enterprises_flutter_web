import 'package:flutter/material.dart';

class BorderlessTextfeild extends StatelessWidget {
  final TextEditingController? textController;
  final FormFieldValidator? validator;

  const BorderlessTextfeild({
    super.key,
    this.textController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 63, // Width in pixels
      height: 30, // Height in pixels
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3), // Background color
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          controller: textController,
          validator: validator,
          textAlign: TextAlign.center, // Center the text inside the field
          decoration: const InputDecoration(
            border: InputBorder.none, // Removes the default border
            // contentPadding:
            //     EdgeInsets.all(8), // Padding inside the TextFormField
          ),
          style: const TextStyle(
            fontSize: 14, // Adjust font size
          ),
        ),
      ),
    );
  }
}
