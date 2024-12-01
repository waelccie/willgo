import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:willgo/core/global/validator.dart';

import '../../core/constants/theme/colors_manager.dart';

class PinCodeFields extends StatelessWidget {
  const PinCodeFields({
    super.key,
    this.onCompleted,
    required this.onChanged,
  });

  final void Function(String)? onCompleted;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => Validator.validateOtp(value ?? ""),
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PinCodeTextField(
              appContext: context,
              autoFocus: true,
              autovalidateMode: AutovalidateMode.disabled,
              cursorColor: ColorsManager.primary,
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
              length: 4,
              animationType: AnimationType.scale,
              enablePinAutofill: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(14),
                fieldHeight: 65.h,
                fieldWidth: 70.w,
                activeColor: const Color(0xFFEAEAEA),
                inactiveColor: const Color(0xFFEAEAEA),
                selectedColor: ColorsManager.primary,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: false,
              onCompleted: onCompleted,
              onChanged: (val) {
                field.didChange(val); // Update field value
                onChanged(val);
              },
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        );
      },
    );
  }
}
