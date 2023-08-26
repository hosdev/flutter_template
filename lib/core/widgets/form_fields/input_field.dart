import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/theme/app_colors.dart';

import '../../theme/text_theme.dart';
import '../../util/sizes.dart';

class PrimaryInputField extends StatelessWidget {
  const PrimaryInputField({
    Key? key,
    this.initialValue,
    this.hintText,
    this.validatorText,
    this.labelText,
    this.keyboardType,
    this.decoration,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlignVertical,
    this.obscuringCharacter = '•',
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.autovalidateMode,
    this.readOnly = false,
    this.obscureText = false,
    this.hasBottomPadding = true,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final String? validatorText;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool readOnly;
  final String obscuringCharacter;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool hasBottomPadding;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (labelText != null)
        //   Padding(
        //     padding: const EdgeInsets.only(bottom: 4),
        //     child: Text(
        //       labelText ?? "",
        //       style: TypographyAppRegular.headline
        //           .copyWith(color: context.appColors.text),
        //     ),
        //   ),
        TextFormField(
          enabled: enabled ?? decoration?.enabled ?? true,
          textDirection: keyboardType == TextInputType.visiblePassword ||
                  keyboardType == TextInputType.emailAddress ||
                  keyboardType == TextInputType.phone
              ? TextDirection.ltr
              : textDirection,
          decoration: decoration ?? InputDecoration(labelText: labelText,hintText: hintText),
          style: style,
          onSaved: onSaved,
          keyboardType: keyboardType,
          validator: validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return validatorText;
                }
                return null;
              },
          maxLength: maxLength,
          textAlign: textAlign,
          maxLines: maxLines,
          onChanged: onChanged,
          obscureText: obscureText,
          readOnly: readOnly,
          minLines: minLines,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode??AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
        ),
        if (hasBottomPadding)
           SizedBox(
            height: AppSizes.inputFieldSpace.h,
          ),
      ],
    );
  }
}
