import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/employee_controller.dart';

class EmployeeView extends GetView<EmployeeController> {
  const EmployeeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmployeeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
