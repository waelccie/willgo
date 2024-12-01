import 'package:willgo/core/extensions/build_context.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';


class LogoutDialog extends GetView<ProfileController> {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(context.translate.logout),
      content: Text(
        context.translate.logout_title,
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            context.translate.cancel,
            style: const TextStyle(color: CupertinoColors.systemBlue),
          ),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context).pop();
            controller.logout();
          },
          child: Text(context.translate.logout),
        ),
      ],
    );
  }
}
