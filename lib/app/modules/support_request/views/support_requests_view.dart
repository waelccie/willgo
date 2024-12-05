
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:willgo/app/modules/support_request/widget/support_request_item.dart';
import 'package:willgo/app/routes/app_pages.dart';
import 'package:willgo/core/constants/theme/colors_manager.dart';
import '../controllers/support_Request_controller.dart';

class SupportRequestsView extends GetView<SupportRequestController> {
  const SupportRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: ColorsManager.primary,
        onPressed: () {
          Get.toNamed(Routes.ADD_SUPPORT_REQUEST);
        },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      backgroundColor:const Color(0xfffcfcfc),
      appBar: AppBar(
        title: const Text('Support Requests'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Obx(() {
          if (controller.supportRequests.isEmpty) {
            return Center(
              child: Text(
                "No support requests found.",
                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.supportRequests.length,
            itemBuilder: (context, index) {
              final request = controller.supportRequests[index];
              return SupportRequestItem(
                answer: request.answer ?? "No Answer",
                id: request.id ?? 0,
                date: request.createdAt?.toString() ?? "Unknown Date",
                name: request.name ?? "No Name",
                note: request.note ?? "No Note",
              );
            },
          );
        }),
      ),
    );
  }
}
