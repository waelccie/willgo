import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/AddSupportRequest/views/add_support_request_view.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';
import 'package:willgo/core/extensions/build_context.dart';
import '../../../data/models/setPrimaryLocation.dart';
import '../../new_location/views/new_location_view.dart';
import '../../new_location/views/new_location_view.dart';
import '../../payment_method/views/paymentSucess.dart';
import 'weidgets.dart';
import '../../../widgets/progress_button.dart';

import '../../../routes/app_pages.dart';
import '../controllers/check_out_controller.dart';

class CheckOutView extends GetView<CheckOutController> {
  const CheckOutView({super.key});
  @override
  Widget build(BuildContext context) {
    int? radioSelected;
    String selectedPayment = '';
    return GetBuilder<CheckOutController>(
      init: CheckOutController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title:  Text(context.translate.checkout),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffE9EAEB)),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        const mapWuidget(),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.translate.your_location,
                                    style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  if (controller.getDelvryLocation?.data?.streetName == null||controller.getDelvryLocation?.data==null)
                                    Text(
                                     context.translate.street,
                                      style: GoogleFonts.almarai(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff878787)),
                                    )
                                  else
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.5,
                                      child: Text(
                                        maxLines: 2,
                                        controller.getDelvryLocation?.data?.streetName
                                            .toString()
                                            .trim()
                                            ??
                                            "",
                                        style: GoogleFonts.almarai(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff878787)),
                                      ),
                                    ),
                                  if (controller.getDelvryLocation?.data?.phoneNumber == null||controller.getDelvryLocation?.data==null)
                                    Text(
                                        context.translate.mobile_number,
                                      style: GoogleFonts.almarai(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff878787)),
                                    )
                                  else
                                    Text(
                                      'mobile number: +20 ${controller.getDelvryLocation?.data?.phoneNumber.toString()} ',
                                      style: GoogleFonts.almarai(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff878787),
                                      ),
                                    )
                                ],
                              ),
                              const Spacer(),
                              Container(
                                  width: 120.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(100),
                                      border: Border.all(
                                          color: const Color(0xff01A0E2))),
                                  child: MaterialButton(
                                    onPressed: () {
                                      controller.isCheck=true;
                                      controller.update();
                                      Get.toNamed(
                                        Routes.UPDATE_CURRUNT_ADDRESS,
                                        arguments: {},
                                      );
                                    },
                                    child: Text(
                                      context.translate.change_location,
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          color: const Color(0xff01A0E2)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  order_address(
                    name: controller.getDelvryLocation?.data?.buildingName ?? "location Name",
                    address: controller.getDelvryLocation?.data?.address ?? "addess",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      "Payment method",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffE9EAEB)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Text(
                              'Cash',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 17.22,
                              ),
                            ),
                            const Spacer(),
                            Radio<int>(
                              fillColor:
                              WidgetStateProperty.resolveWith<Color?>(
                                    (Set<WidgetState> states) {
                                  if (states
                                      .contains(WidgetState.selected)) {
                                    return const Color(0xff01A0E2);
                                  }
                                  return Colors.grey;
                                },
                              ),
                              value: 1,
                              groupValue: radioSelected,
                              onChanged: (value) {
                                radioSelected = value;
                                selectedPayment = 'Cash';
                                controller.update();
                              },
                              activeColor: Colors.blue,
                              focusColor: const Color(0xff01A0E2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 0.0, vertical: 8),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12),
                  //       border: Border.all(color: const Color(0xffE9EAEB)),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(6.0),
                  //       child: Row(
                  //         children: [
                  //           Text(
                  //             'Online',
                  //             style: GoogleFonts.roboto(
                  //               fontWeight: FontWeight.w600,
                  //               fontSize: 17.22,
                  //             ),
                  //           ),
                  //           const Spacer(),
                  //           Radio<int>(
                  //             fillColor:
                  //             WidgetStateProperty.resolveWith<Color?>(
                  //                   (Set<WidgetState> states) {
                  //                 if (states
                  //                     .contains(WidgetState.selected)) {
                  //                   return const Color(0xff01A0E2);
                  //                 }
                  //                 return Colors.grey; // اللون الافتراضي
                  //               },
                  //             ),
                  //             value: 2,
                  //             groupValue: radioSelected,
                  //             onChanged: (value) {
                  //               radioSelected = value;
                  //               selectedPayment = 'Online';
                  //               controller.update();
                  //             },
                  //             activeColor: Colors.blue,
                  //             focusColor: const Color(0xff01A0E2),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const PaymentSummeryWidget(),
                  SizedBox(height: 8.h),
                  AppProgressButton(
                    onPressed: (c) {
                      if (radioSelected == 1&&controller.getDelvryLocation?.data?.id !=null) {
                        controller.checkOut(
                          controller.getDelvryLocation!.data!.id!.toInt(),
                          selectedPayment,
                        );


                      } else {
                        BotToast.showText(text: "تأكد من ادخال العنوان");
                      }
                    },
                    child: Text(
                      "check out",
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )


        );
      },
    );
  }
}
