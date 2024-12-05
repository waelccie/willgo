import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/data/models/user_model.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';
import '../controllers/profile_controller.dart';
import '../../../widgets/progress_button.dart';

import '../../../../core/global/const.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/network_image.dart';

class PersonaldataView extends StatelessWidget {
  const PersonaldataView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (ProfileController controller) {
        return CustomFutureBuilder<UserModel>(
          future: controller.getUserData,
          onData: (BuildContext context, UserModel data) {
            controller.phone.text = data.data!.phone.toString();
            controller.name.text = data.data!.name.toString();
            controller.email.text = data.data!.email.toString();

            return Scaffold(
              appBar: AppBar(
                title: const Text('Personal Data'),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: const Color(0xFFEEEEEE),
                          child: Text(
                            '${data.data!?.name.toString().substring(0, 1)}',
                            style: const TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      controller: controller.name,
                      borderRadius: 8,
                      labelStyle: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff101010)),
                      height: 40.h,
                      // controller: controller.userController,
                      hint: "Full Name",
                      name: "Full Name",
                      type: TextInputType.name,
                    ),
                    SizedBox(height: 18.h),
                    // CustomTextField(
                    //   controller: controller.password,
                    //
                    //   borderRadius: 8,
                    //   labelStyle: GoogleFonts.inter(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500,
                    //       color: const Color(0xff101010)),
                    //   height: 40.h,
                    //   // controller: controller.userController,
                    //   hint: "Date of birth",
                    //   name: "Date of birth",
                    //   type: TextInputType.name,
                    // ),
                    CustomTextField(
                      controller: controller.phone,

                      borderRadius: 8,
                      labelStyle: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff101010)),
                      height: 40.h,
                      // controller: controller.userController,
                      hint: "Phone",
                      name: "Phone",
                      type: TextInputType.name,
                    ),
                    SizedBox(height: 18.h),
                    CustomTextField(
                      controller: controller.email,

                      borderRadius: 8,
                      labelStyle: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff101010)),
                      height: 40.h,
                      // controller: controller.userController,
                      hint: "Email",
                      name: "Email",
                      type: TextInputType.name,
                    ),
                    const Spacer(),
                    AppProgressButton(
                      onPressed: (d) {
                        controller.updateprofile();
                      },
                      backgroundColor: const Color(0xff01A0E2),
                      text: "Save",
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
