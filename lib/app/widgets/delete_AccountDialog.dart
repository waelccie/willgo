import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:willgo/core/extensions/build_context.dart';

import '../modules/profile/controllers/profile_controller.dart';

class DeleteAccpont extends GetView<ProfileController> {
  const DeleteAccpont({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Delete Accouct"),
      content: Text(
        "We hope you come back again"
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
            controller.deleteAccount();


          },
          child: Text("submit"),
        ),
      ],
    );
  }
}
