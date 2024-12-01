import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:willgo/app/data/apis/Product_DetailsApi.dart';
import 'package:willgo/app/data/models/cart.dart';
import 'package:willgo/app/modules/cart/views/weidgets.dart';

import '../../../../core/global/const.dart';
import '../../../data/apis/cart_apis.dart';
import '../../../data/parameters/cart/update.dart';
import '../../../widgets/loading_widget.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  final count = 0.obs;
  @override
  void onInit() {

    getCart=ProductDetailsApi.getCart();
    update();

    super.onInit();
  }

  late Future<Cart>getCart;

int quentity=0;

  void increment() => count.value++;


  Future<void> updte_Cart(quantity,id) async {

    showLoading();
    var res = await CartApis.addToCart(
      parameters: UpadeCartParameters(quantity:quantity.toString() ), id: id,
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");

    } else {
      showErrorsSequentially(res.errors ?? []);

      BotToast.closeAllLoading();
    }
  }


  Future<void> deleteItem_Cart(id) async {

    showLoading();
    var res = await CartApis.delete_item(
      id: id,
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
      getCart=ProductDetailsApi.getCart();
update();
    } else {
      showErrorsSequentially(res.errors ?? []);

      BotToast.closeAllLoading();
    }
  }


  void increeseQantity(quantity){
  quantity=quantity+1;
  update();

}
  void decreeseQantity(quantity){
    quantity--;
    update();
  }

}
