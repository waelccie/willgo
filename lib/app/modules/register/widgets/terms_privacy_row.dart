import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/theme/colors_manager.dart';
import '../controllers/register_controller.dart';

class TermsPrivacyRow extends GetView<RegisterController> {
  const TermsPrivacyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller) {
      return Row(
        children: [
          Checkbox(
            value: controller.termsAndConditions,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: controller.onChangeTermsAndConditions,
            activeColor: ColorsManager.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: const BorderSide(
              color: ColorsManager.darkGrey,
              width: 2,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "I Agree with ",
                  style: TextStyle(
                    color: ColorsManager.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: "Terms of Service",
                  style: const TextStyle(
                    color: ColorsManager.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                const TextSpan(
                  text: " and ",
                  style: TextStyle(
                    color: ColorsManager.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: const TextStyle(
                    color: ColorsManager.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
