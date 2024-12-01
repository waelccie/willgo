import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willgo/app/data/apis/check_out_apis.dart';
import '../../../../core/global/const.dart';
import '../../../data/apis/location_apis.dart';
import '../../../data/models/cart.dart';
import '../../../data/models/setPrimaryLocation.dart';
import '../../../data/parameters/checkOut.dart';
import '../../../widgets/loading_widget.dart';
import '../../payment_method/views/paymentSucess.dart';

class CheckOutController extends GetxController {
  @override
  void onInit() {
    getCart = Get.arguments?["payment"];
    getdetDefaultLocation();
    update();

    super.onInit();
  }

  SetPrimaryLocatiom? getDelvryLocation;
bool isCheck=false;

  Future<void> getdetDefaultLocation()async{
    getDelvryLocation = await NewLocationApis.getDefaultLocation();
update();
  }

  late Future<Cart> getCart;

  Future<void> checkOut(int id, String payment) async {
    showLoading();
    var res = await CheckApis.makeOrder(
      parameters: PaymentParameters(
        locationId: id.toString(),
        paymentMethod: payment.toString(),
      ),
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
      Get.off(() => const Paymentsucess());
    } else {
      showErrorsSequentially(res.errors?[0] ?? []);
      BotToast.closeAllLoading();
    }
  }
}
