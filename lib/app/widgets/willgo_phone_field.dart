import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/theme/colors_manager.dart';
import '../../core/constants/theme/styles_manager.dart';
import '../../core/global/debouncer.dart';
import 'required_text_widget.dart';

class WillGoPhoneField extends StatelessWidget {
  final Color? iconColor;
  final Color? labelColor;
  final Color? hintColor;
  final TextInputType? type;
  final String? hint;
  final Iterable<String>? autoFillHints;
  final String? anotherHint;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final String? Function(String?)? validate;
  final int? maxLines;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool keyboardPadding;
  final bool contentPadding;
  final int? maxLength;
  final bool? autoFocus;
  final String? errorText;
  final Color? fillColor;
  final Color? textColor;
  final Widget? suffixIcon;
  final String? initialValue;
  final Widget? prefixIcon;
  final bool isEnabled;
  final bool needMargin;
  final bool readOnly;
  final double? textSize;
  final TextDirection? textDirection;
  final List<TextInputFormatter>? formattedType;
  final double height;
  final double borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final bool isNeedToElevation;
  final TextAlign? textAlign;
  final bool needToSuffixConstraints;
  final bool isResendSuffixIcon;
  final bool isBold;
  final TextInputAction inputAction;
  final FocusNode? focusNode;
  final String? name;
  final bool isRequired;
  final void Function(bool)? onFocusChange;
  final void Function()? onEditingComplete;
  const WillGoPhoneField({
    super.key,
    this.focusNode,
    this.type,
    this.hint,
    this.isRequired = false,
    this.autoFillHints,
    this.onChange,
    this.validate,
    this.onFocusChange,
    this.focusedBorderColor = ColorsManager.primary,
    this.inputAction = TextInputAction.next,
    this.onTap,
    this.maxLines,
    this.isEnabled = true,
    this.onEditingComplete,
    this.controller,
    this.errorText,
    this.fillColor,
    this.textColor,
    this.maxLength,
    this.formattedType,
    this.iconColor,
    this.labelColor,
    this.keyboardPadding = true,
    this.contentPadding = false,
    this.autoFocus,
    this.initialValue,
    this.onSubmit,
    this.prefixIcon,
    this.readOnly = false,
    this.needMargin = true,
    this.textDirection,
    this.anotherHint,
    this.suffixIcon,
    this.textSize,
    this.height = 50,
    this.borderRadius = 14,
    this.isNeedToElevation = false,
    this.hintColor,
    this.textAlign,
    this.borderColor = Colors.grey,
    this.needToSuffixConstraints = false,
    this.isResendSuffixIcon = false,
    this.isBold = true,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 750);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null)
          RequiredTextWidget(
            text: name ?? "",
            isRequired: isRequired,
          ),
        if (name != null) SizedBox(height: 8.h),
        TextFormField(
          enableSuggestions: true,
          focusNode: focusNode,
          autofillHints: autoFillHints,
          onTap: onTap,
          textInputAction: inputAction,
          readOnly: readOnly,
          onEditingComplete: onEditingComplete,
          initialValue: initialValue,
          autofocus: autoFocus ?? false,
          maxLength: maxLength,
          textDirection: textDirection,
          textAlign: textAlign ?? TextAlign.start,
          controller: controller,
          maxLines: maxLines ?? 1,
          validator: validate,
          keyboardType: type,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (val) {
            if (onChange != null) {
              debouncer.run(
                () {
                  onChange!(val);
                },
              );
            }
          },
          inputFormatters: formattedType ?? [],
          style: StylesManager.regular(
            fontSize: textSize ?? 14,
            color: textColor ?? const Color(0xFF39434F),
          ),
          scrollPadding: EdgeInsets.only(
            bottom:
                keyboardPadding ? MediaQuery.of(context).size.height * .2 : 0.0,
          ),
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            hintStyle: StylesManager.regular(
              fontSize: 14,
              color: hintColor ?? Colors.grey[600],
            ),
            isDense: true,
            enabled: isEnabled,
            hintText: anotherHint ?? hint ?? "",
            labelStyle: TextStyle(
              fontSize: 16,
              color: labelColor ?? ColorsManager.white,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: true,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide: BorderSide(color: borderColor!, width: 0.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide: BorderSide(color: borderColor!, width: 0.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide:
                  const BorderSide(color: ColorsManager.error, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide:
                  const BorderSide(color: ColorsManager.primary, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide: BorderSide(color: borderColor!, width: 0.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide: BorderSide(color: borderColor!, width: 0.5),
            ),
            fillColor: fillColor ?? Colors.transparent,
            filled: true,
            errorText: errorText,
            errorMaxLines: 1,
            prefixIcon: Icon(
              Icons.phone,
              color: iconColor ?? Colors.grey,
            ),
            suffixIcon: suffixIcon,
            suffixIconConstraints: needToSuffixConstraints
                ? BoxConstraints(
                    minHeight: 47,
                    minWidth: isResendSuffixIcon ? 30 : 1,
                    maxHeight: 48,
                    maxWidth: isResendSuffixIcon ? 30 : 1,
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: height < 49
                  ? suffixIcon != null || prefixIcon != null
                      ? 0
                      : height - 30
                  : (24.h + height - 50.h),
            ),
          ),
        ),
      ],
    );
  }
}
