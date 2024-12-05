import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:willgo/app/data/apis/support_request_apis.dart';

import 'package:willgo/app/data/models/get_support_requests_model.dart';

class SupportRequestController extends GetxController {
  final count = 0.obs;

  final supportRequests = <SupportRequestModel>[].obs;

  @override
  void onInit() {
    fetchSupportRequests();
    super.onInit();
  }

  void increment() => count.value++;

  Future<void> fetchSupportRequests() async {
    BotToast.showLoading();
    var response = await SupportRequestApis.get_SupportRequests();

    if (response != null && response.success == true) {
      supportRequests.assignAll(response.data ?? []);
      BotToast.closeAllLoading();
    } else {
      BotToast.closeAllLoading();
      BotToast.showText(
        text: response?.message ?? "Failed to fetch support requests",
      );
    }
  }
}
