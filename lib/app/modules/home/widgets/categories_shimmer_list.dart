import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'category_shimmer_widget.dart';

class CategoriesShimmerList extends StatelessWidget {
  const CategoriesShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: context.width,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return const CategoryItemShimmer();
        },
      ),
    );
  }
}
