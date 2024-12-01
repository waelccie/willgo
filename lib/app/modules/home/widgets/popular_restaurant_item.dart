import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/network_image.dart';
import '../../../widgets/stars_bar.dart';
import '../../../../core/global/const.dart';

class PopularRestaurantItem extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final int rating;
  final Function()? onTap;

  const PopularRestaurantItem({
    super.key,
    required this.name,
    this.imageUrl,
    this.rating = 5,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCashedImage(
              imageUrl: imageUrl ?? dummyImage,
              width: 200.w,
              height: 150.h,
              fit: BoxFit.cover,
              radius: 30,
            ),
            SizedBox(height: 10.h),
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 3.h),
            StarsBar(stars: rating.toDouble()),
          ],
        ),
      ),
    );
  }
}
