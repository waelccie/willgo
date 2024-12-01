import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/theme/colors_manager.dart';

class OtherAuthMethodRow extends StatelessWidget {
  const OtherAuthMethodRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: ColorsManager.darkGrey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: const Text(
            "Or sign in with",
            style: TextStyle(
              color: ColorsManager.darkGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: ColorsManager.darkGrey,
          ),
        ),
      ],
    );
  }
}
