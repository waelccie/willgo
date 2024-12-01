import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'home_offer_widget.dart';

class HomeOffersListView extends StatelessWidget {
  const HomeOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 4,
      width: context.width,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          return const HomeOfferWidget();
        },
      ),
    );
  }
}
