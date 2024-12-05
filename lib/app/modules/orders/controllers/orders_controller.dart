import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willgo/app/data/apis/OrderApis.dart';

import '../../../../core/global/const.dart';
import '../../../../core/services/get_storage_helper.dart';
import '../../../data/models/Order_Model.dart';
import '../../../data/models/order_DetailsModel.dart';
import '../../../widgets/loading_widget.dart';
import '../views/orderTracking.dart';

class OrdersController extends GetxController {
  //TODO: Implement OrdersController

  final count = 0.obs;

  @override
  void onInit() {
    getOrder = OrderApis.get_Order();

    super.onInit();
  }

  late Future<OrderModel> getOrder;
  late OrderDetailsModel getOrderDetail;

  void increment() => count.value++;

  Future<void> getOrderDetails(id, context) async {
    showLoading();
    var res = await OrderApis.get_OrderDetails(id);

    if (res.success == true) {
      getOrderDetail = res;
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Ordertracking()));
    } else {
      showErrorsSequentially(res.errors ?? []);

      BotToast.closeAllLoading();
    }
  }
}
