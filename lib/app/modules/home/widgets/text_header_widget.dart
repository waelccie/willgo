// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:willgo/core/constants/theme/colors_manager.dart';

class TextHeaderWidget extends StatelessWidget {
  const TextHeaderWidget({
    super.key,
    required this.title,
    this.subTitle,
    this.onTap,
  });
  final String title;
  final String? subTitle;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        if (subTitle != null)
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
            child: Text(
              subTitle!,
              style: const TextStyle(
                fontSize: 13,
                color: ColorsManager.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
