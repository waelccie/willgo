import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:willgo/app/modules/AddSupportRequest/views/add_support_request_view.dart';
import 'package:willgo/core/extensions/build_context.dart';

import '../../../../core/constants/theme/colors_manager.dart';

class OtherAuthMethodRow extends StatelessWidget {
  const OtherAuthMethodRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.h,
            color: ColorsManager.darkGrey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child:  Text(
           context.translate.orsiginwith,
            style: TextStyle(
              color: ColorsManager.darkGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1.h,
            color: ColorsManager.darkGrey,
          ),
        ),
      ],
    );
  }
}
