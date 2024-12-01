// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/constants/theme/colors_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.withMaterial,
  });
  final bool withMaterial;
  @override
  Widget build(BuildContext context) {
    if (withMaterial) {
      return const Material(
        child: Center(
          child: SpinKitSpinningLines(
            color: ColorsManager.primary,
          ),
        ),
      );
    }
    return const Center(
      child: SpinKitSpinningLines(
        color: ColorsManager.primary,
      ),
    );
  }
}

void showLoading() {
  BotToast.showCustomLoading(
    toastBuilder: (cancelFunc) {
      return const LoadingWidget(withMaterial: false);
    },
  );
}
