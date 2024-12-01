import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/progress_button.dart';

import '../controllers/cancel_order_controller.dart';

class CancelOrderView extends GetView<CancelOrderController> {
  const CancelOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancel Order'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
                    'Change of mind',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 15.22),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
                    'Found better price elsewhere',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 15.22),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
                    'Delivery delay',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 15.22),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
                    'Incorrect item selected',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 15.22),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
                    'Change of mind',
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
                        height: 450,
                        width: MediaQuery.of(context)
                            .size
                            .width, // Set your desired height
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
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
                                "Your Order Canceled",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "We're sorry to see your order go. 😔We're always striving to improve, and we hope to serve you better next time!",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: const Color(0xff878787)),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              AppProgressButton(
                                onPressed: (c) {},
                                child: Text(
                                  "ok",
                                  style: GoogleFonts.dmSans(
                                      color: Colors.white,
                                      fontSize: 17,
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
