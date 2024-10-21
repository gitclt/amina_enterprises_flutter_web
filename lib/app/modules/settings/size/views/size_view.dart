import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/size_controller.dart';

class SizeView extends GetView<SizeController> {
  const SizeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SizeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SizeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
