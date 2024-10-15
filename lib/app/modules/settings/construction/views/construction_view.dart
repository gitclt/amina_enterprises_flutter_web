import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/construction_controller.dart';

class ConstructionView extends GetView<ConstructionController> {
  const ConstructionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConstructionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ConstructionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
