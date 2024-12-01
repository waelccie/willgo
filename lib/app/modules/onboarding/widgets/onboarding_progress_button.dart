import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/theme/colors_manager.dart';
import 'circle_progress_bar.dart';

class CustomProgressButton extends StatelessWidget {
  const CustomProgressButton({
    super.key,
    required this.index,
    required this.listLength,
    required this.next,
    required this.onTapSkipButton,
  });
  final int index;
  final int listLength;
  final Function() next;
  final Function() onTapSkipButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        index != listLength - 1 ? next() : onTapSkipButton();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: CircleProgressBar(
              backgroundColor: ColorsManager.primary.withOpacity(.4),
              foregroundColor: ColorsManager.primary,
              value: ((index + 1) * 1.0 / listLength),
            ),
          ),
          Container(
            height: 53.h,
            width: 53.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.primary,
            ),
            child: Center(
              child: index == listLength - 1
                  ? const Text(
                      "Start",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Icon(
                      Platform.isIOS
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_forward,
                      color: Colors.white,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
