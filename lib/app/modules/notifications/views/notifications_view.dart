import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: Padding(
          padding:  EdgeInsets.only(left: 15.0.w),
          child: Container(
            height: 1.h,
            width: 1.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffEDEDED))
            ),
            child: const Icon(Icons.arrow_back_ios_outlined,color: Colors.black,size: 18,),
          ),
        ),
        title:  Text('Notification',style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors. black,
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today',style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xff878787)
            ),),
            SizedBox(height: 16.h,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xffF5F5FF),
                    radius: 25,
                    child: Icon(Icons.mail_outline,color: Colors.black,),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("35% Special Discount!",style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),),
                      const SizedBox(height: 4,),
                      Text("Special promotion only valid today",style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff878787)
                      ),)

                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 16.h,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xffF5F5FF),
                    radius: 25,
                    child: Icon(Icons.person,color: Colors.black,),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Account Setup Successfull!",style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),),
                      const SizedBox(height: 4,),
                      Text("Special promotion only valid today",style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xff878787)
                      ),)

                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
