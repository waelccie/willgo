import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/AddSupportRequest/views/add_support_request_view.dart';
import 'package:willgo/core/extensions/build_context.dart';
import '../../../widgets/progress_button.dart';

import '../controllers/cancel_order_controller.dart';

class CancelOrderView extends GetView<CancelOrderController> {
  const CancelOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(  context.translate.cancelorder),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xffE9EAEB))),
              child: Row(
                children: [
                  Radio<String>(
                    fillColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color(0xff01A0E2); // Color when selected
                        }
                        return Colors.grey; // Default color
                      },
                    ),
                    value: "1",
                    groupValue: "",
                    onChanged: (String? value) {},
                    activeColor: Colors.blue,
                    focusColor: const Color(0xff01A0E2),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                      context.translate.changeofmind,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 15.22.sp),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xffE9EAEB))),
              child: Row(
                children: [
                  Radio<String>(
                    fillColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color(0xff01A0E2); // Color when selected
                        }
                        return Colors.grey; // Default color
                      },
                    ),
                    value: "1",
                    groupValue: "",
                    onChanged: (String? value) {},
                    activeColor: Colors.blue,
                    focusColor: const Color(0xff01A0E2),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                      context.translate.foundbetterpriceelsewhere,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 15.22.sp),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xffE9EAEB))),
              child: Row(
                children: [
                  Radio<String>(
                    fillColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color(0xff01A0E2); // Color when selected
                        }
                        return Colors.grey; // Default color
                      },
                    ),
                    value: "1",
                    groupValue: "",
                    onChanged: (String? value) {},
                    activeColor: Colors.blue,
                    focusColor: const Color(0xff01A0E2),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                      context.translate.deliverydelay,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 15.22.sp),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xffE9EAEB))),
              child: Row(
                children: [
                  Radio<String>(
                    fillColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color(0xff01A0E2); // Color when selected
                        }
                        return Colors.grey; // Default color
                      },
                    ),
                    value: "1",
                    groupValue: "",
                    onChanged: (String? value) {},
                    activeColor: Colors.blue,
                    focusColor: const Color(0xff01A0E2),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                      context.translate.incorrectitemselected,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 15.22.sp),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xffE9EAEB))),
              child: Row(
                children: [
                  Radio<String>(
                    fillColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color(0xff01A0E2); // Color when selected
                        }
                        return Colors.grey; // Default color
                      },
                    ),
                    value: "1",
                    groupValue: "",
                    onChanged: (String? value) {},
                    activeColor: Colors.blue,
                    focusColor: const Color(0xff01A0E2),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                      context.translate.changeofmind,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 15.22),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppProgressButton(
              onPressed: (c) {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                        height: 450.h,
                        width: MediaQuery.of(context)
                            .size
                            .width, // Set your desired height
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: 8.0.h, horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 4.h,
                                width: 58.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xffffcccccc),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Image(
                                image:
                                    const AssetImage("assets/images/heart.png"),
                                height: 143.h,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                context.translate.yourordercancelled,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.sp,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                               context.translate.weresorrytoseeyourordergo,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: const Color(0xff878787)),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              AppProgressButton(
                                onPressed: (c) {},
                                child: Text(
                                  context.translate.ok,
                                  style: GoogleFonts.dmSans(
                                      color: Colors.white,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                );
              },
              child: Text(
                'Submit',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
