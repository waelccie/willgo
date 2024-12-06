import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:willgo/app/modules/check_out/controllers/check_out_controller.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/phone_text_form_field.dart';
import '../../../widgets/progress_button.dart';

import '../../environment/controllers/environment_controller.dart';
import '../controllers/new_location_controller.dart';
import 'Weidgets.dart';

class AddFullAddress extends StatefulWidget {
  final city,street;
  const AddFullAddress({super.key,required this.city,required this.street});

  @override
  State<AddFullAddress> createState() => _AddFullAddressState();
}

class _AddFullAddressState extends State<AddFullAddress> {
  @override
  void initState() {
    // TODO: implement initState
    Get.put(CheckOutController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: InkWell(
          onTap: (){
            Get.back();
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
      body: GetBuilder<NewLocationController>(
        builder: (controller){
          controller.streetController.text=widget.street.toString();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          height: 120.h,
                          child: MapWidgetFullAddress(myLocation: controller.position==null? LatLng(Get.find<EnvironmentController>().latLng!.latitude, Get.find<EnvironmentController>().latLng!.longitude):LatLng(controller.position!.latitude, controller.position!.longitude), getLocationAndAddress:  controller.getLocationAndAddress,)),

                    ],
                  ),              SizedBox(
                    height: 8.h,
                  ),
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
                                'your location',
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                              Text(
                               controller.cityAndCountry.toString(),
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              )
                            ],
                          ),
                          // const Spacer(),
                          // TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       "change",
                          //       style: GoogleFonts.dmSans(
                          //           fontSize: 16, fontWeight: FontWeight.w600),
                          //     ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  AppProgressButton(
                    onPressed: (s) {
                      controller.add_newLocation();
                    },
                    child: Text(
                      'Save Address',
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),

                 if(Get.find<CheckOutController>().isCheck==true) Container(child: Column(children: [
                    CustomTextField(
                      controller:controller.buildingName ,
                      type: TextInputType.text,
                      hint: 'building name',
                      name: 'building name ',
                      labelStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xff4C555F)),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      children: [
                        Expanded(

                          child: CustomTextField(
                            controller: controller.appartNum,
                            hint: 'Apartment number',
                            name: 'Apartment number ',
                            type: TextInputType.number,

                            labelStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color(0xff4C555F)),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: controller.floor,
                            hint: 'floor',
                            name: 'floor ',
                            type: TextInputType.number,

                            labelStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color(0xff4C555F)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomTextField(
                      controller: controller.streetController,
                      hint: 'street',
                      name: 'street ',
                      type: TextInputType.text,
                      labelStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xff4C555F)),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomTextField(
                      type: TextInputType.text,
                      controller: controller.additionalData,

                      hint: 'Addtional details',
                      name: 'Addtional details ',
                      labelStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xff4C555F)),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    PhoneTextFormField(

                      controller: controller.phone,
                      hintText: '(+44) 564645646',
                      name: 'phone number',
                    ),
                    SizedBox(height: 14.h),
                    AppProgressButton(
                      onPressed: (s) {
                        controller.add_newLocation();
                      },
                      child: Text(
                        'Save Address',
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],),)

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
