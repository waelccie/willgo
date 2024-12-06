import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:willgo/app/data/models/cart.dart';
import 'package:willgo/app/modules/check_out/controllers/check_out_controller.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';

import '../../../../core/constants/const/app_constants.dart';

class mapWuidget extends StatelessWidget {
  const mapWuidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      height: 143.h,
      width: MediaQuery.of(context).size.width,
      child: FlutterMap(
        options: MapOptions(
          center:  LatLng(24.6911, 46.7268),
          zoom: 12.0,
          maxZoom: 18,
          onTap: (_, __) {},
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
            subdomains: const ['a', 'b', 'c'],
            backgroundColor: Colors.white,
            additionalOptions: const {
              'type': 'light_all',
              'language': 'ar',
            },
          ),
          // MarkerLayer(
          //   markers: mosques.map((mosque) {
          //     return Marker(
          //       width: 40,
          //       height: 40,
          //       point: mosque.location,
          //       builder: (context) => GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             selectedMosque = mosque;
          //           });
          //         },
          //         child: SvgPicture.asset(
          //           'Assets/images/marker.svg',
          //           width: 40,
          //           height: 40,
          //         ),
          //       ),
          //     );
          //   }).toList(),
          // ),
          // إظهار معلومات المسجد المحدد
        ],
      ),
    );
  }
}

class order_address extends StatelessWidget {
  final name, address;
  const order_address({super.key, required this.name, this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffEDEDED)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: 'Deliver to ',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.27,
                          color: const Color(0xff101010))),
                  TextSpan(
                      text: name,
                      style: GoogleFonts.inter(
                          fontSize: 15.27, fontWeight: FontWeight.w600))
                ]),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(address,
                  style: GoogleFonts.inter(
                      fontSize: 15.27, fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentSummeryWidget extends StatelessWidget {
  const PaymentSummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<Cart>(
      future: Get.find<CheckOutController>().getCart,
      onData: (BuildContext context, Cart data) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffEDEDED)),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Summary',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Items (${data.data!.data?.length??0})',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xff878787)),
                      ),
                      Text(
                        '${AppConstants.appCurrency} ${data.data!.price}',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xff878787)),
                      ),
                      Text(
                          data.data!.deliveryFee.toString(),
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xff878787)),
                      ),
                      Text(
                        '-${AppConstants.appCurrency} ${data.data!.discount}',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff01A0E2),
                            fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xff878787)),
                      ),
                      Text(
                        '${AppConstants.appCurrency} ${data.data!.totalPrice}',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      )
                    ],
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
