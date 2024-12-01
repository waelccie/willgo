import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/progress_button.dart';
import '../controllers/delevery_address_controller.dart';

class DeleveryAddressView extends GetView<DeleveryAddressController> {
  const DeleveryAddressView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Address'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xffD6D6D6))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home',
                          style: GoogleFonts.dmSans(
                              color: const Color(0xff101010),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '221B Baker Street, Lon...',
                          style: GoogleFonts.dmSans(
                              color: const Color(0xff101010),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const Spacer(),
                    Radio<String>(
                      fillColor: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return const Color(
                                0xff01A0E2); // Color when selected
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            AppProgressButton(
              onPressed: (c) {
                Get.toNamed(Routes.NEW_LOCATION);
              },
              backgroundColor: const Color(0xffF0F5FF),
              radius: 8,
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Color(0xff01A0E2),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "Add New Location",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: const Color(0xff01A0E2)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
