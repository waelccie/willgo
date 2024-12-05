
import 'package:flutter/material.dart';
import 'package:willgo/core/constants/theme/colors_manager.dart';

class Bubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const Bubble({required this.message, required this.isSender, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
      decoration: BoxDecoration(
        color: isSender ? ColorsManager.blue2 : ColorsManager.grey2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSender ? 12 : 0),
          topRight: Radius.circular(isSender ? 0 : 12),
          bottomLeft: const Radius.circular(12),
          bottomRight: const Radius.circular(12),
        ),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: isSender ? Colors.black : Colors.black,
        ),
      ),
    );
  }
}
