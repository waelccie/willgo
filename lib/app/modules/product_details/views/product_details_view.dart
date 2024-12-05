import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';

import '../../../../core/services/get_storage_helper.dart';
import '../../../data/models/product_details.dart' as x;
import '../controllers/product_details_controller.dart';
import 'Widgets/AdditionalOption.dart';
import 'Widgets/discribtionWidget.dart';
import 'Widgets/foterButton.dart';
import 'Widgets/product_Info.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProductDetailsController>(
          init: ProductDetailsController(),
          builder: (ProductDetailsController controller) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: CustomFutureBuilder<x.ProductDetails>(
                      future: controller.getproductDetail,
                      onData: (context, data) {
                        final product = data.data;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            product_Info(
                                context,
                                product!.enName,
                                product.price,
                                product.currentPrice,
                                product.rate,
                                0,
                                product.isDiscount as bool,
                                product.images?[0]),
                            SizedBox(
                              height: 12.h,
                            ),
                            FoodDescriptionCard(
                              description: product.description.toString(),
                              nutritionalInfo: {
                                "info":
                                    product.nutritionalInformation.toString()
                              },
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            product.options!.isEmpty
                                ? Center(
                                    child: Text(
                                    "No Additional Option Found",
                                    style: TextStyle(color: Colors.grey),
                                  ))
                                : AdditionalOptionsWidget(
                                    options: product.options!,
                                  ),
                            SizedBox(
                              height: 12.h,
                            ),
                            CacheHelper.getUserToken != null
                                ? foteButton(
                                    product.id,
                                    Get.find<ProductDetailsController>()
                                        .quantity)
                                : Container()
                          ],
                        );
                      }),
                ),
              ),
            );
          }),
    );
  }
}
