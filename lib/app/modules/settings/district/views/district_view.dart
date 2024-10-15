import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/district_controller.dart';

class DistrictView extends GetView<DistrictController> {
  const DistrictView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DistrictView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DistrictView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
