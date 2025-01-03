import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:willgo/app/modules/environment/views/internet_connection_view.dart';
import 'package:willgo/app/modules/profile/controllers/profile_controller.dart';
import 'package:willgo/core/extensions/build_context.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/progress_button.dart';
import '../../../../core/global/validator.dart';
import '../controllers/add_support_request_controller.dart';

class AddSupportRequestView extends GetView<AddSupportRequestController> {
   AddSupportRequestView({super.key});
   

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSupportRequestController>(
      builder: (controller) {

        return Scaffold(
          appBar: AppBar(
            title:  Text(context.translate.addrequest),
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
                    hint: context.translate.name,
                    name: context.translate.name,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    borderRadius: 30.r,

                  controller: controller.emailController,

                    hint: context.translate.email,
                    name: context.translate.email,
                    type: TextInputType.emailAddress,
                    validate: Validator.validateEmail,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    borderRadius: 30.r,
                    controller: controller.noteController,
                    hint: context.translate.note,
                    name: context.translate.note,
                    maxLines: 8,
                  ),
                  SizedBox(height: 50.h),
                  AppProgressButton(
                    onPressed: (anim) {
                      controller.submitRequest();
                    },
                    text: context.translate.send,
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
