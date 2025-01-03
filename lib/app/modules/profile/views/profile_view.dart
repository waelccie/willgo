import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';
import 'package:willgo/app/widgets/progress_button.dart';
import 'package:willgo/core/constants/const/app_constants.dart';
import '../../../../core/services/get_storage_helper.dart';
import '../../../data/models/user_model.dart';
import '../../../widgets/delete_AccountDialog.dart';
import '../Widget/bottomSheetWidget.dart';
import '../Widget/logout_dialog.dart';
import 'personal_data.dart';
import 'settings.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import '../Widget/widget.dart';
import 'help.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Profile Settings',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: CacheHelper.getUserToken == null
              ? Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffF0F5FF)),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Nice to meet you !",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                AppProgressButton(
                                  radius: 10,
                                  height: 50,
                                  onPressed: (d) {
                                    Get.toNamed(Routes.AUTH);
                                  },
                                  child: Text(
                                    "Log in/ Sign Up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Settings()));
                          },
                          child: buildListTile(
                              'Settings', Icons.settings_outlined)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 8),
                          child: Text(
                            'Support',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color(0xff878787),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HelpCenterPage()));
                          },
                          child:
                              buildListTile('Help Center', Icons.help_outline)),
                    ],
                  ),
                )
              : CustomFutureBuilder<UserModel>(
                  future: controller.getUserData,
                  onData: (context, data) {
                    var user = data.data;
                    return Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 24),
                                // Profile Avatar and Info
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor: const Color(0xFFEEEEEE),
                                      child: Text(
                                        '${user?.name.toString().substring(0, 1)}',
                                        style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      '${user?.name.toString()}',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${user?.email}',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: const Color(0xff878787),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                // Profile Section
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 8),
                                    child: Text(
                                      'Profile',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: const Color(0xff878787),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PersonaldataView()));
                                    },
                                    child: buildListTile(
                                        'Personal Data', Icons.person_outline)),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Settings()));
                                    },
                                    child: buildListTile(
                                        'Settings', Icons.settings_outlined)),
                                // GestureDetector(
                                //     onTap: () {
                                //       Get.toNamed(Routes.FAV_RESTURANT);
                                //     },
                                //     child: buildListTile('favourite resturants',
                                //         Icons.favorite_border)),
                                const SizedBox(height: 24),
                                // Support Section
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 8),
                                    child: Text(
                                      'Support',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: const Color(0xff878787),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HelpCenterPage()));
                                    },
                                    child: buildListTile(
                                        'Help Center', Icons.help_outline)),
                                GestureDetector(
                                    onTap: () {
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (context) =>
                                            const DeleteAccpont(),
                                      );
                                      //  Get.toNamed(Routes.PAYMENT_METHOD);
                                    },
                                    child: buildListTile(
                                        'Request Account Deletion',
                                        Icons.delete_outline)),
                                // buildListTile(
                                //     'Add another account', Icons.person_add_outlined),
                                const SizedBox(height: 24),
                                // Sign Out Button
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: const Color(0xFFD6D6D6),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextButton.icon(
                                      onPressed: () async {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              width: context.width,
                                              height: context.height * 0.25, // Set your desired height
                                              child:Padding(
                                                padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 18.w),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        height: 4.h,
                                                        width: 50.w,
                                                        color: const Color(0xffD6D6D6),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 12.h,
                                                    ),
                                                    Text(
                                                      'SignOut',
                                                      style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
                                                    ),
                                                    SizedBox(
                                                      height: 18.h,
                                                    ),
                                                    Text("Do You Want To LogOut",style: GoogleFonts.dmSans(
                                                      color: Colors.grey
                                                    ),),
                                                    SizedBox(
                                                      height: 25.h,
                                                    ),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: AppProgressButton(onPressed: (v){
                                                              Navigator.of(context).pop();
            controller.logout();
                                                          },child: Text("LogOut",style: GoogleFonts.dmSans(
                                                            color: Colors.white
                                                          ),),),
                                                        ),
                                                        SizedBox(width: 5,),

                                                        Expanded(
                                                          child: MaterialButton(onPressed: (){
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            height:52.h,
                                                            width:180.w,

                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                                                            border: Border.all(color: Colors.grey)
                                                            ),
                                                            child: Center(child: Text("Cancel",style: GoogleFonts.dmSans(color: Colors.grey,fontWeight: FontWeight.w500),)),
                                                          ),
                                                          )
                                                        )
                                                      ],
                                                    )
                                                  ],

                                                ),
                                              )
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.logout,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                      label: const Text(
                                        'Sign Out',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
        );
      },
    );
  }


  void show(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: context.width,
          height: context.height * 0.3, // Set your desired height
          child: BottomSheetView(context),
        );
      },
    );
  }
}
