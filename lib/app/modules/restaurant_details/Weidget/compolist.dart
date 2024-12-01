import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:willgo/app/data/models/product_model.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';
import '../../../routes/app_pages.dart';
import '../controllers/restaurant_details_controller.dart';
import 'productWidget.dart';


final RestaurantDetailsController controller = Get.find<RestaurantDetailsController>();
Widget CompoList(context)=>

 CustomFutureBuilder<ResturantProductModel>(
future: controller.getproduct,
onData: (context, data) {
final product_res = data.data;
 return ListView.separated(
      itemBuilder: (context,index)=>GestureDetector(
       onTap: (){
        Get.toNamed(
         Routes.PRODUCT_DETAILS,
         arguments: {
          "product_id": product_res[index].id,

         },
        );
       },
          child: ProductWidget(product_res[index].enName,product_res[index].description,product_res[index].price,context)),
      separatorBuilder: (context,index)=>SizedBox(height: 16.h,),
      itemCount: product_res!.length);}
);