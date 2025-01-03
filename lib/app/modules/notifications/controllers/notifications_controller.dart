import 'package:get/get.dart';
import 'package:willgo/app/data/apis/home_apis.dart';
import 'package:willgo/app/data/models/notifactionModel.dart';

class NotificationsController extends GetxController {
  //TODO: Implement NotificationsController

  final count = 0.obs;

  void increment() => count.value++;



  @override
  void onInit() {
    getNotifaction = HomeApis.get_Notifaction();

    super.onInit();
  }

  late Future<NotifactionModel> getNotifaction;

}
