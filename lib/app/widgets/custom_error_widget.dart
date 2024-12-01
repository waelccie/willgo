import '../../../core/extensions/build_context.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Assets.images.error.image()),
            SizedBox(height: 20.h),
            Text(
              context.translate.try_again,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            if (kDebugMode)
              Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
