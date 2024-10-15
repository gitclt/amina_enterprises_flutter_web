import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sub_category_controller.dart';

class SubCategoryView extends GetView<SubCategoryController> {
  const SubCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubCategoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SubCategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
