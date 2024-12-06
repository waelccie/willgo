import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:willgo/app/modules/profile/controllers/profile_controller.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/progress_button.dart';
import '../../../../core/global/validator.dart';
import '../controllers/add_support_request_controller.dart';

class AddSupportRequestView extends GetView<AddSupportRequestController> {
   AddSupportRequestView({super.key});
    final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSupportRequestController>(
      builder: (controller) {

        return Scaffold(
          appBar: AppBar(
            title: const Text("Add Request"),
            centerTitle: true,
          ),
          body: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                borderRadius: 30.r,

                    controller: controller.nameController,
                    hint: "Name",
                    name: "Name",
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    borderRadius: 30.r,

                  controller: controller.emailController,

                    hint: "Email",
                    name: "Email",
                    type: TextInputType.emailAddress,
                    validate: Validator.validateEmail,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    borderRadius: 30.r,
                    controller: controller.noteController,
                    hint: "Note",
                    name: "Note",
                    maxLines: 8,
                  ),
                  SizedBox(height: 50.h),
                  AppProgressButton(
                    onPressed: (anim) {
                      controller.submitRequest();
                    },
                    text: "Send",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
