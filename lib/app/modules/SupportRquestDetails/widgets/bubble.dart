
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:willgo/app/modules/AddSupportRequest/views/add_support_request_view.dart';
import 'package:willgo/core/constants/theme/colors_manager.dart';

class Bubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const Bubble({required this.message, required this.isSender, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 30.h),
      padding:  EdgeInsets.symmetric(vertical: 13.h, horizontal: 14.h),
      decoration: BoxDecoration(
        color: isSender ? ColorsManager.blue2 : ColorsManager.grey2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSender ? 12.r : 0),
          topRight: Radius.circular(isSender ? 0 : 12.r),
          bottomLeft:  Radius.circular(12.r),
          bottomRight:  Radius.circular(12.r),
        ),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color:  Colors.black,
        ),
      ),
    );
  }
}
