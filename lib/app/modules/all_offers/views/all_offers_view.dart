import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_offers_controller.dart';

class AllOffersView extends GetView<AllOffersController> {
  const AllOffersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllOffersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllOffersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
