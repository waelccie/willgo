import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/all_offers/bindings/all_offers_binding.dart';
import 'package:willgo/app/modules/home/controllers/home_controller.dart';
import 'package:willgo/app/routes/app_pages.dart';
import '../../../widgets/progress_button.dart';
import '../../nav_screen/views/nav_screen_view.dart';

class Paymentsucess extends StatefulWidget {
  const Paymentsucess({super.key});

  @override
  State<Paymentsucess> createState() => _PaymentsucessState();
}

class _PaymentsucessState extends State<Paymentsucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Payment Successful',style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: 20
            ),),
            SizedBox(height: 8.h,),
            Image(image: const AssetImage("assets/images/confetti 1.png"),height: 143.h,width: 143.w,),
            Text('Thank you for your order!',style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 15
            ),),
            const SizedBox(height: 8,),

            Text("Your payment has been successfully\n processed.",textAlign: TextAlign.center,style: GoogleFonts.roboto(

              fontSize: 15,
              fontWeight: FontWeight.w400,color: const Color(0xff4C555F)
            ),),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 16),
              child: AppProgressButton(onPressed: (v){
                Get.put(HomeController());

              Get.toNamed(Routes.NAV_SCREEN);
               Get.reloadAll(force: true);
              },child: Text("Ok. Great!",style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.white
              ),),),
            )
          ],
        ),
      ),
    );
  }
}
