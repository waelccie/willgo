import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ChatView'),
            centerTitle: true,
          ),
          body: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.CHAT);
              //todo go to Route
              Get.to(() => const ChatView());

              //todo go to screen
            },
            child: const Center(
              child: Text(
                'ChatView is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
