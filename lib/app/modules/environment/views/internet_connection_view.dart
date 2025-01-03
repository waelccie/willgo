import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/theme/styles_manager.dart';
import '../../../../core/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../controllers/environment_controller.dart';

class InternetConnectionView extends GetView<EnvironmentController> {
  const InternetConnectionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SvgPicture.asset("assets/images/wifi.svg"),
              SizedBox(height: 20.h),
              Text(
                context.translate.you_are_offline,
                style: StylesManager.bold(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                textAlign: TextAlign.center,
                context.translate.please_connect_to_the_internet_and_try_again,
                style: StylesManager.light(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
