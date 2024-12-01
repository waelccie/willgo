import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/const/app_constants.dart';
import '../../../../core/constants/theme/colors_manager.dart';
import '../../../../core/global/const.dart';
import '../../../widgets/network_image.dart';

class HomeOfferWidget extends StatelessWidget {
  const HomeOfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppCashedImage(
                  imageUrl: dummyImage,
                  width: context.width,
                  fit: BoxFit.cover,
                  radius: 30,
                ),
              ),
              SizedBox(height: 10.h),
              const Text(
                "The Pizza Place",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "300 ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: AppConstants().getAppCurrency(),
                      style: const TextStyle(
                        color: ColorsManager.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.favorite_border,
                color: ColorsManager.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
