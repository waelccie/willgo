import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/data/models/notifactionModel.dart';

import '../../../../core/services/get_storage_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_future_builder.dart';
import '../../../widgets/progress_button.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
        init: NotificationsController(),
      builder: (controller){
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leadingWidth: 60,
                leading: InkWell(
                  onTap: () {
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
                  'Notification',
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                
                      CacheHelper.getUserToken == null
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
                          : CustomFutureBuilder<NotifactionModel>(
                        future: controller.getNotifaction,
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
                                
                              ],
                            ),
                          )
                              : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: (){
                                      if(data.data[index].data!.typeName.toString()=="order"){
                                        Get.toNamed(Routes.ORDERS);
                                      }else{
                                        Get.toNamed(Routes.SUPPORTT);

                                      }
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const CircleAvatar(
                                                backgroundColor: Color(0xffF5F5FF),
                                                radius: 25,
                                                child: Icon(
                                                  Icons.mail_outline,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width:250.w,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                           data.data[index].title.toString(),
                                                          style: GoogleFonts.inter(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16,
                                                          ),

                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          data.data[index].createdAt.toString().substring(0,11),
                                                          style: GoogleFonts.inter(
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 14,
                                                              color: const Color(0xff878787)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                    data.data[index].description.toString(),
                                                    style: GoogleFonts.inter(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                        color: const Color(0xff878787)),
                                                  )
                                                ],
                                              ),


                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 18,
                                      ),
                                      Container(height: 0.25,color: Colors.grey,),
                                      SizedBox(
                                        height: 18,
                                      ),
                                    ],
                                  );
                                },
                                itemCount: data.data!.length,
                              ),
                            ),
                          );
                        },
                      ),
                
                
                
                
                    ],
                  ),
                ),
              ));
      },
    );
  }
}
