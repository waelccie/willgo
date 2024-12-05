import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';
import '../../../../core/services/get_storage_helper.dart';
import '../../../data/models/Order_Model.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/progress_button.dart';
import 'weidget.dart';
import '../controllers/orders_controller.dart';
import 'orderTracking.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      init: OrdersController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            // leading: Padding(
            //   padding:  EdgeInsets.only(left: 15.0.w),
            //   child: Container(
            //     height: 1.h,
            //     width: 1.w,
            //     decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         border: Border.all(color: const Color(0xffEDEDED))
            //     ),
            //     child: const Icon(Icons.arrow_back_ios_outlined,color: Colors.black,size: 18,),
            //   ),
            // ),
            title: Text(
              "Orders",
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
          body: CacheHelper.getUserToken == null
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/NotFound.svg"),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "We couldn't find any result!",
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "please Login / Register",
                        style: GoogleFonts.dmSans(color: Color(0xff878787)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      AppProgressButton(
                        radius: 10,
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        onPressed: (d) {
                          Get.toNamed(Routes.AUTH);
                        },
                        child: Text(
                          "Log in/ Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              : CustomFutureBuilder<OrderModel>(
                  future: controller.getOrder,
                  onData: (BuildContext context, data) {
                    return data.data!.isEmpty
                        ? Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/NotFound.svg"),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "We couldn't find any result!",
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Come on, make your first order",
                                  style: GoogleFonts.dmSans(
                                      color: Color(0xff878787)),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.getOrderDetails(
                                          data.data![index].id, context);
                                    },
                                    child: OrderCard(
                                      title: data
                                              .data?[index].restaurant!.enName
                                              .toString() ??
                                          "",
                                      orderId:
                                          data.data?[index].id.toString() ?? "",
                                      date: data.data?[index].createdAt
                                              .toString()
                                              .substring(0, 11) ??
                                          "",
                                      totalAmount:
                                          data.data![index].total.toString() ??
                                              "",
                                      quantity: data.data?[index].orderProducts
                                              ?.length ??
                                          0,
                                      status:
                                          data.data?[index].status.toString() ??
                                              "",
                                      statusColor: Colors.orange,
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 12,
                                  );
                                },
                                itemCount: data.data!.length,
                              ),
                            ),
                          );
                  },
                ),
        );
      },
    );
  }
}
