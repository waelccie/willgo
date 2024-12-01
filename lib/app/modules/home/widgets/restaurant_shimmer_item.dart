import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:willgo/app/widgets/main_shimmer_widget.dart';

class PopularRestaurantItemShimmer extends StatelessWidget {
  const PopularRestaurantItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: MainShimmerWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmer for the image
            Container(
              height: 200.h,
              width: context.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            SizedBox(height: 10.h),
            // Shimmer for the name text
            Container(
              height: 16.h,
              width: context.width / 2,
              color: Colors.white,
            ),
            SizedBox(height: 3.h),
            // Shimmer for the rating bar
            Row(
              children: List.generate(
                5,
                (index) => Container(
                  margin: EdgeInsets.only(right: 4.w),
                  height: 14.h,
                  width: 14.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
