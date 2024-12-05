import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:willgo/app/widgets/network_image.dart';
import '../../../../core/constants/theme/colors_manager.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String? imageUrl;

  const CategoryItem({
    super.key,
    required this.name,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6.w), 
      decoration: BoxDecoration(
        // color: ColorsManager.primaryBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppCashedImage(
            imageUrl: imageUrl ?? "",
            fit: BoxFit.cover,
            width: 56.w,
            height: 56.h,
            isCircular: true,
          ),
          SizedBox(height: 4.h),
          Text(
            name,
            style:  TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
