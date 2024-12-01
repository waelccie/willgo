import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:willgo/app/data/apis/Product_DetailsApi.dart';

import '../../../../core/global/const.dart';
import '../../../data/apis/auth_apis.dart';
import '../../../data/models/product_details.dart'as x;
import '../../../data/parameters/cart/add to cart.dart';
import '../../../widgets/loading_widget.dart';

class ProductDetailsController extends GetxController {
  //TODO: Implement ProductDetailsController

  final count = 0.obs;



  void increment() => count.value++;
  var id;
  @override
  void onInit() {
    // TODO: implement onInit
    id = Get.arguments?["product_id"];

getproductDetail=ProductDetailsApi.getProductsDetails(id);
    super.onInit();
  }




  late Future <x.ProductDetails>getproductDetail;

  Future<void> addtoCart(productId,quantity) async {

    showLoading();
    var res = await ProductDetailsApi.addToCart(
      parameters: CartParameters(products: [Product(productId: productId, quantity: quantity, options: [])]),
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");

    } else {
      showErrorsSequentially(res.errors ?? []);

      BotToast.closeAllLoading();
    }
  }


int  quentity=1;
  void increese(){
    quentity++;
    update();
  }

  void dicrese(){
   if(quentity!=1){
     quentity--;
     update();
   }
  }


  List<dynamic> options1=[];


}
