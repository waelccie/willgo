import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:willgo/app/data/apis/Product_DetailsApi.dart';
import 'package:willgo/app/data/models/cart.dart';
import 'package:willgo/app/modules/cart/views/weidgets.dart';
import '../../../../core/global/const.dart';
import '../../../data/apis/cart_apis.dart';
import '../../../data/parameters/cart/update.dart';
import '../../../widgets/loading_widget.dart';

class CartController extends GetxController {
  late Future<Cart> getCart;

  @override
  void onInit() {

    getCart = ProductDetailsApi.getCart();
    update();
    super.onInit();
  }
  late bool isLocationEnabled;



  // دالة للتحقق من حالة خدمات الموقع
  Future<void> checkLocationStatus(coctext) async {
    isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      // عرض رسالة للمستخدم
      showLocationDialog(coctext);
    }
  }

  // عرض حوار للمستخدم لتفعيل خدمات الموقع
  void showLocationDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("خدمات الموقع غير مفعلة"),
        content: Text("يرجى تفعيل خدمات الموقع لاستخدام هذه الميزة."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // إغلاق الحوار
            },
            child: Text("إلغاء"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // إغلاق الحوار
              Geolocator.openLocationSettings(); // فتح إعدادات الموقع
            },
            child: Text("فتح الإعدادات"),
          ),
        ],
      ),
    );
  }
  Future<void> updte_Cart(String quantity, dynamic id) async {
    showLoading();
    var res = await CartApis.addToCart(
      parameters: UpadeCartParameters(quantity: quantity),
      id: id,
    );

    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
      getCart = ProductDetailsApi.getCart(); // Refresh cart
      update();
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
      getCart = ProductDetailsApi.getCart(); // Refresh cart
      update();
    } else {
      showErrorsSequentially(res.errors ?? []);
      BotToast.closeAllLoading();
    }
  }

  void incrementQuantity(int currentQuantity, dynamic itemId) {
    int newQuantity = currentQuantity + 1;
    updte_Cart(newQuantity.toString(), itemId);
  }

  void decrementQuantity(int currentQuantity, dynamic itemId) {
    if (currentQuantity > 1) {
      int newQuantity = currentQuantity - 1;
      updte_Cart(newQuantity.toString(), itemId);
    }
  }
}