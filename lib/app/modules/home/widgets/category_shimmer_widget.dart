import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:willgo/app/widgets/main_shimmer_widget.dart';

class CategoryItemShimmer extends StatelessWidget {
  const CategoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: context.width / 2.5,
      decoration: BoxDecoration(
        color: Colors.grey[200], // Placeholder background color
        borderRadius: BorderRadius.circular(24),
      ),
      child: MainShimmerWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 56.h,
              width: 56.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              height: 16.h,
              width: 54.w,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
