import 'package:bta/utils/colors.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final String? floatingText;
  final Color floatingTextColor;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final int? lines;
  final TextStyle hintStyle;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final double contentPadding;
  final double contentPaddingX;
  final double contentPaddingY;
  final Color fillColor;
  final Color borderColor;
  final Color borderFocus;
  final bool expands;
  final bool readOnly;
  final bool enabled;
  const MyTextFormField(
      {super.key,
      required this.label,
      this.textAlign = TextAlign.start,
      this.textAlignVertical = TextAlignVertical.top,
      this.hintStyle = const TextStyle(),
      this.floatingText,
      this.floatingTextColor = Colors.grey,
      this.validator,
      this.onSaved,
      this.onTap,
      this.lines = 1,
      this.initialValue,
      this.keyboardType,
      this.onChanged,
      this.onFieldSubmitted,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.controller,
      this.expands = false,
      this.readOnly = false,
      this.enabled = true,
      this.fillColor = Colors.white,
      this.borderColor = Colors.grey,
      this.borderFocus = AppColors.primary,
      this.contentPadding = 16,
      this.contentPaddingX = 24,
      this.contentPaddingY = 16});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        floatingText != null
            ? Column(children: [
                Text(
                  floatingText ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: floatingTextColor,
                  ),
                ),
                const SizedBox(height: 12),
              ])
            : const SizedBox(),
        TextFormField(
          onTap: onTap,
          style: const TextStyle(
            fontSize: 16,
          ),
          enabled: enabled,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          cursorColor: Theme.of(context).colorScheme.primary,
          // cursorHeight: 16,
          keyboardAppearance: Brightness.light,
          controller: controller,
          maxLines: lines,
          expands: expands,
          initialValue: initialValue,
          validator: (value) {
            if (validator != null) {
              return validator!(value);
            }
            return null;
          },
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          onSaved: onSaved,
          onChanged: onChanged,
          keyboardType: keyboardType,
          readOnly: readOnly,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
            fillColor: enabled ? fillColor : Colors.grey[200],
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white12, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary, width: 1),
            ),
            contentPadding: EdgeInsets.all(contentPadding),
            hintText: initialValue != null ? null : label,
            hintStyle: hintStyle,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
