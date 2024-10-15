import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/color_controller.dart';

class ColorView extends GetView<ColorController> {
  const ColorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ColorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ColorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
