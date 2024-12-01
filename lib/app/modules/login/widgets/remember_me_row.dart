import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/theme/colors_manager.dart';
import '../../../../core/enums/enums.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class RememberMeRow extends GetView<LoginController> {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (context) {
        return Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: controller.rememberMe,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: controller.onChangeRememberMe,
                    activeColor: ColorsManager.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    side: const BorderSide(
                      color: ColorsManager.darkGrey,
                      width: 2,
                    ),
                  ),
                  const Text(
                    "Remember me",
                    style: TextStyle(
                      color: ColorsManager.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.FORGET_PASSWORD,
                  arguments: {
                    "type": VerifictionType.reset_password,

                  },
                );
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: ColorsManager.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
