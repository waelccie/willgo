// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:willgo/core/constants/theme/colors_manager.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.image,
    this.onTap,
  });
  final String image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorsManager.grey.withOpacity(.5),
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          image,
          width: 25.w,
          height: 25.h,
        ),
      ),
    );
  }
}
