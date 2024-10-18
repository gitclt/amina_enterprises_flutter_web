import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:amina_enterprises_flutter_web/app/constants/colors.dart';

DateTime? _selectedDate;
DateTime? _selectedInitialDate;

Future<void> selectDate(
    BuildContext context, TextEditingController textController) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: _selectedDate ?? DateTime.now(),
    firstDate: DateTime(1950),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColor.primary, // Header background color
            onPrimary: Colors.white, // Header text color
            onSurface: Colors.red, // Body text color
          ),
          //dialogBackgroundColor: AppColor.primary, // Background color
        ),
        child: child!,
      );
    },
  );
  if (picked != null && picked != _selectedDate) {
    _selectedDate = picked;
    // if (date == 'joinDate') {
    textController.text = DateFormat('dd-MM-yyyy').format(_selectedDate!);
    // }
  }
}

Future<void> selectInitialDate(
    BuildContext context, TextEditingController textController) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColor.primary, // Header background color
            onPrimary: Colors.white, // Header text color
            onSurface: Colors.red, // Body text color
          ),
          //dialogBackgroundColor: AppColor.primary, // Background color
        ),
        child: child!,
      );
    },
  );
  if (picked != null && picked != _selectedInitialDate) {
    _selectedInitialDate = picked;
    // if (date == 'joinDate') {
    textController.text =
        DateFormat('yyyy-MM-dd').format(_selectedInitialDate!);
    // }
  }
}
