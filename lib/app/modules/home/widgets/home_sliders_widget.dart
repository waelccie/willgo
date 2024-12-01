import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:willgo/app/widgets/network_image.dart';
import '../../../../core/constants/theme/colors_manager.dart';
import '../../../data/models/sliders_model.dart';
import '../../../widgets/custom_future_builder.dart';
import '../../../widgets/empty_widget.dart';
import '../../../widgets/main_shimmer_widget.dart';
import '../controllers/home_controller.dart';

class HomeSlidersWidget extends GetView<HomeController> {
  const HomeSlidersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return CustomFutureBuilder<SlidersModel>(
          future: controller.getAllSliders,
          onData: (context, data) {
            List<Slider>? ads = data.data;
            if (ads?.isEmpty ?? true) return const EmptyWidget();
            return Column(
              children: [
                CarouselSlider(
                  items: ads?.map((i) {
                    return AppCashedImage(
                      imageUrl: i.image ?? "",
                      width: context.width,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    initialPage: 0,
                    viewportFraction: .85,
                    enableInfiniteScroll: true,
                    reverse: false,
                    height: 140.h,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.linearToEaseOut,
                    onPageChanged: (index, reason) {
                      controller.onChangeAdsIndex(index);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 12.h),
                DotsIndicator(
                  dotsCount: ads?.length ?? 0,
                  position: controller.adsIndex,
                  decorator: DotsDecorator(
                    color: ColorsManager.darkGrey.withOpacity(0.5),
                    activeColor: ColorsManager.primary,
                  ),
                ),
              ],
            );
          },
          loadingWidget: MainShimmerWidget(
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: context.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        );
      },
    );
  }
}
