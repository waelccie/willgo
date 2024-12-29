import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../../../routes/app_pages.dart';
import '../../environment/controllers/environment_controller.dart';
import 'Weidgets.dart';
import '../../../widgets/progress_button.dart';
import '../controllers/new_location_controller.dart';
import 'add_full_address.dart';

class NewLocationView extends GetView<NewLocationController> {
  const NewLocationView({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewLocationController>(
      init: NewLocationController(),
      builder: (controller){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leadingWidth: 60,
            leading: InkWell(
              onTap: (){
                Get.toNamed(Routes.UPDATE_CURRUNT_ADDRESS);
              },
              child: Padding(
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
            ),
            title: Text(
              'Add New Location',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          height: 400.h,
                          child: MapWidgetFullAddress(myLocation: controller.position==null? LatLng(Get.find<EnvironmentController>().latLng!.latitude, Get.find<EnvironmentController>().latLng!.longitude):LatLng(controller.position!.latitude, controller.position!.longitude), getLocationAndAddress:  controller.getLocationAndAddress,)),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 58,
                    height: 3,
                    decoration: const BoxDecoration(color: Color(0xff878787)),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Location",
                    style: GoogleFonts.dmSans(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffF0F5FF),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          controller.cityAndCountry==null?Text(
                            "loaction....",
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ): Text(
                            "${controller.cityAndCountry??""}",
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.location_on_outlined,
                            color: Color(0xff01A0E2),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffF0F5FF),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          controller.street==null? Text(
                            'street name.....',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ) : Text(
                            controller.street.toString().trim().toString(),
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  AppProgressButton(
                    onPressed: (v) {
                      if(controller.street!=null&&controller.cityAndCountry!=null){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddFullAddress(city: controller.cityAndCountry , street:  controller.street,)));
                      }else{
                        BotToast.showText(text: "pick your Location from Map");
                      }
                    },
                    child: Text(
                      'Enter Full Address',
                      style: GoogleFonts.dmSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
