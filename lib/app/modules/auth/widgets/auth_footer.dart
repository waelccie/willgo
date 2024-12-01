import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/theme/colors_manager.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });
  final String title;
  final String subTitle;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ColorsManager.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subTitle,
            style: const TextStyle(
              color: ColorsManager.primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
