import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'paymentSucess.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/progress_button.dart';
import '../controllers/payment_method_controller.dart';

class PaymentMethodView extends GetView<PaymentMethodController> {
  const PaymentMethodView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 15.0.w),
          child: Container(
            height: 1.h,
            width: 1.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffEDEDED))),
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
        title: Text(
          "Payment Methods",
          style: GoogleFonts.dmSans(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xffE9EAEB))),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.moneyBill1,
                      color: const Color(0xffff0e9347),
                      weight: 22.w,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      'Cash',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600, fontSize: 17.22),
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xffE9EAEB))),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.paypal,
                      color: const Color(0xff253B80),
                      weight: 22.w,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      'PayPal',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600, fontSize: 17.22),
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffE9EAEB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: Color(0xff01A0E2),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text(
                      'Add New Card',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.2,
                          color: Color(0xff01A0E2)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppProgressButton(
              onPressed: (c) {
                final PaymentMethodController paymentController =
                    Get.put(PaymentMethodController());

                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0)),
                  ),
                  isScrollControlled:
                      true, // Allows full control over the height
                  builder: (BuildContext context) {
                    return GetBuilder<PaymentMethodController>(
                      builder: (controller) {
                        final PaymentMethodController paymentController =
                            Get.put(PaymentMethodController());

                        return SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffcccccc),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  height: 3,
                                  width: 58.2,
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "Add New Card",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12),
                                  child: Image.asset(
                                      "assets/images/credit_card.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12),
                                  child: CustomTextField(
                                    height: 43.h,
                                    controller: controller.card_number,
                                    borderColor: const Color(0xffE9EAEB),
                                    name: 'Card Number',
                                    labelStyle: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.45,
                                      color: const Color(0xff4C555F),
                                    ),
                                    hint: '**** **** **** ****',
                                    hintColor: const Color(0xff0D1217),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12),
                                  child: CustomTextField(
                                    height: 43.h,
                                    borderColor: const Color(0xffE9EAEB),
                                    name: 'Cardholder Name',
                                    labelStyle: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.45,
                                      color: const Color(0xff4C555F),
                                    ),
                                    hint: 'Enter Cardholder Name',
                                    hintColor: const Color(0xff0D1217),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 12),
                                        child: CustomTextField(
                                          height: 43.h,
                                          borderColor: const Color(0xffE9EAEB),
                                          name: 'Expiry Date / Valid Thru',
                                          labelStyle: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.45,
                                            color: const Color(0xff4C555F),
                                          ),
                                          hint: '--/--',
                                          suffixIcon: const Icon(
                                            Icons.date_range_rounded,
                                            color: Colors.black,
                                          ),
                                          hintColor: const Color(0xff0D1217),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 12),
                                        child: CustomTextField(
                                          height: 43.h,
                                          borderColor: const Color(0xffE9EAEB),
                                          name: 'CVV / CVC',
                                          labelStyle: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.45,
                                            color: const Color(0xff4C555F),
                                          ),
                                          hint: 'Enter CVV',
                                          hintColor: const Color(0xff0D1217),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: AppProgressButton(
                                    onPressed: (v) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Paymentsucess()));
                                    },
                                    child: Text(
                                      "Save",
                                      style: GoogleFonts.roboto(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Text(
                "Apply",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.7,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
