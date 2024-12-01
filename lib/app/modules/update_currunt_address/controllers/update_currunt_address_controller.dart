import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';

import '../../../../core/global/const.dart';
import '../../../data/apis/location_apis.dart';
import '../../../data/models/getLocation.dart';
import '../../../widgets/loading_widget.dart';

class UpdateCurruntAddressController extends GetxController {
  //TODO: Implement UpdateCurruntAddressController

  final count = 0.obs;



  void increment() => count.value++;


  @override
  void onInit() {

    getLocations=NewLocationApis.getLocation();

update();
    super.onInit();
  }
  late Future<GetLocation>getLocations;
  int? selectedId;


  Future<void> setDefaultLocation(id) async {

    showLoading();
    var res = await NewLocationApis.setDefaultLocation(id: selectedId
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");

    } else {
      showErrorsSequentially(res.errors ?? []);

      BotToast.closeAllLoading();
    }
  }


}
