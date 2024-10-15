import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/designation_controller.dart';

class DesignationView extends GetView<DesignationController> {
  const DesignationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DesignationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DesignationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
