import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:willgo/app/data/apis/support_request_apis.dart';
import 'package:willgo/app/data/parameters/support_request/support_request_parameters.dart';
import 'package:willgo/core/global/const.dart';

import '../../../../core/services/get_storage_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/loading_widget.dart';

class AddSupportRequestController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  Future<void> submitRequest() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    showLoading();

    var parameters = SupportRequestParameters(
      name: nameController.text,
      email: emailController.text,
      note: noteController.text,
    );

    var res = await SupportRequestApis.addSupportRequest(parameters: parameters);

    if (res != null && res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Added successfully.");
                Get.toNamed(Routes.SUPPORTT);

      
    } else {
      showErrorsSequentially(res?.errors ?? []);
      BotToast.closeAllLoading();
    }
  }
}
