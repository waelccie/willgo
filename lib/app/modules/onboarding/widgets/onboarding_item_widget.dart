// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:willgo/core/constants/theme/colors_manager.dart';

import '../../../data/models/onboarding_model.dart';

class OnboardingItemWidget extends StatelessWidget {
  const OnboardingItemWidget({
    super.key,
    required this.iteml,
    required this.index,
  });
  final OnboardingModel iteml;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          iteml.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.h),
        if (index != 2)
          Image.asset(iteml.image)
        else
          Container(
            padding: EdgeInsets.all(40.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorsManager.primary,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                iteml.image,
                width: 150.w,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}
