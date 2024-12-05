import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/data/models/order_DetailsModel.dart';
import 'package:willgo/app/modules/orders/controllers/orders_controller.dart';
import 'trackingWEidget.dart';
import 'weidget.dart';

class Ordertracking extends StatelessWidget {
  const Ordertracking({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffEDEDED)),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
            ),
            title: Text(
              "order status",
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
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "order no:",
                          style: GoogleFonts.dmSans(
                            color: const Color(0xff5C5C5C),
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          "2345512345",
                          style: GoogleFonts.dmSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Tracking Steps
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon Container
                            Padding(
                              padding: EdgeInsets.only(right: 8.0.w, top: 25.h),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffE9EAEB),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                height: 37.h,
                                width: 37.w,
                                child: Icon(
                                  OrderTrackingPage().icons[index],
                                  color: const Color(0xff01A0E2),
                                  size: 20,
                                ),
                              ),
                            ),

                            // Stepper
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: AnotherStepper(
                                  stepperList: [
                                    OrderTrackingPage().steps[index]
                                  ],
                                  stepperDirection: Axis.vertical,
                                  activeBarColor: Colors.blue,
                                  inActiveBarColor: Colors.blue,
                                  verticalGap: 26,
                                  activeIndex: 0,
                                  barThickness: 10,
                                  iconWidth: 10,
                                  iconHeight: 10,
                                ),
                              ),
                            ),

                            // Time Display
                            Padding(
                              padding: EdgeInsets.only(left: 8.0.w, top: 25.h),
                              child: Text(
                                "8:55 PM",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: OrderTrackingPage().steps.length,
                  ),
                ),

                // Remaining Widgets as SliverToBoxAdapter
                SliverToBoxAdapter(
                  child: order_SummeryWidget1(controller.getOrderDetail),
                ),
                SliverToBoxAdapter(
                  child: order_address(context, controller.getOrderDetail),
                ),
                SliverToBoxAdapter(
                  child: paymentdetails(context, controller.getOrderDetail),
                ),
                SliverToBoxAdapter(
                  child: payment_SummeryWidget1(controller.getOrderDetail),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
