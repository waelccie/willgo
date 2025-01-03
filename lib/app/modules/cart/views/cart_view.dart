import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:willgo/app/modules/AddSupportRequest/views/add_support_request_view.dart';
import 'package:willgo/app/modules/check_out/controllers/check_out_controller.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';
import 'package:willgo/core/extensions/build_context.dart';
import 'package:willgo/core/global/const.dart';
import '../../../../core/services/get_storage_helper.dart';
import '../../../data/models/cart.dart';
import 'payment_summeryWidget.dart';
import 'weidgets.dart';
import '../../../widgets/progress_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_text_field.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController()..checkLocationStatus(context),
      builder: (CartController controller) {
        return Scaffold(
          appBar: AppBar(
            title:  Text(context.translate.cart),
            centerTitle: true,
          ),
          body: CacheHelper.getUserToken == null?
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/NotFound.svg"),
                SizedBox(height: 30.h,),
                Text(context.translate.we_couldnt_find_any_result,style: GoogleFonts.dmSans(fontWeight: FontWeight.w700,fontSize: 16),),
                SizedBox(height: 20.h,),
                Text(context.translate.please_login_register,style: GoogleFonts.dmSans(color: Color(0xff878787)),),
                SizedBox(height: 30.h,),
                AppProgressButton(radius: 10.r,height: 50.h,width: MediaQuery.of(context).size.width*0.8,onPressed: (d){
                  Get.toNamed(Routes.AUTH);
                },child: Text(context.translate.log_in_sign_up,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),)

              ],
            ),
          ):SingleChildScrollView(
            child:
            Column(
              children: [
                CustomFutureBuilder(
                  future: controller.getCart,
                  onData: (BuildContext context, Cart data) {
                    final cart = data.data;
                    return data.data==null||data.data!.data!.isEmpty?Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/NotFound.svg"),
                          SizedBox(height: 30.h,),
                          Text(context.translate.we_couldnt_find_any_result,style: GoogleFonts.dmSans(fontWeight: FontWeight.w700,fontSize: 16),),
                          SizedBox(height: 20.h,),
                          Text(context.translate.please_make_your_first_order,style: GoogleFonts.dmSans(color: Color(0xff878787)),),

                        ],
                      ),
                    ):Container(

                      width: Get.width,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return cartItem(
                            name: cart?.data?[index].product?.enName,
                            image: cart?.data?[index].product?.images?[0],
                            cat: cart?.data?[index].product?.category?.nameEn,
                            price: cart?.data?[index].totalPrice,
                            initialQuantity: cart?.data?[index].quantity ?? 0,

                            controller: controller,
                            id: cart?.data?[index].id,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 5);
                        },
                        itemCount: cart?.data?.length ?? 0,
                      ),
                    );
                  },
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                //   child: CustomTextField(
                //     prefixIcon: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //       child: SvgPicture.asset(
                //         Assets.icons.discount.path,
                //         width: 8,
                //       ),
                //     ),
                //     suffixIcon: Padding(
                //       padding: const EdgeInsets.all(2.0),
                //       child: AppProgressButton(
                //         onPressed: (d) {},
                //         width: 100.w,
                //         height: 20.h,
                //         child: Text(
                //           'Apply',
                //           style: GoogleFonts.dmSans(
                //               fontSize: 12,
                //               fontWeight: FontWeight.w500,
                //               color: Colors.white),
                //         ),
                //       ),
                //     ),
                //     hint: 'Promo Code. . .',
                //     borderRadius: 8,
                //     labelStyle: GoogleFonts.inter(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //       color: const Color(0xff101010),
                //     ),
                //   ),
                // ),
                CustomFutureBuilder(
                  future: controller.getCart,
                  onData: (BuildContext context, Cart data) {
                    return data.data==null|| data.data?.totalItems==0?Container():Column(
                      children: [
                        payment_SummeryWidget(
                          delivery: data.data?.deliveryFee,
                          quentity: data.data?.totalItems,
                          price: data.data?.price,
                          dicsounr: data.data?.discount,
                          total: data.data?.totalPrice,
                        ),
                         SizedBox(height: 50.h),
                        Padding(
                          padding:
                           EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 8.h),
                          child: AppProgressButton(
                            onPressed: (d) {


                              Get.toNamed(
                                Routes.CHECK_OUT,
                                arguments: {"payment": controller.getCart},
                              );
                            },
                            child: Text(
                             context.translate.checkout,
                              style: GoogleFonts.dmSans(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
