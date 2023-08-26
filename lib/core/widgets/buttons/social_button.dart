import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {Key? key,
      this.onTap,
      this.text = "",
      required this.logoPath,
      this.withText = true})
      : super(key: key);
  final VoidCallback? onTap;
  final String text;
  final String logoPath;
  final bool withText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          padding: EdgeInsets.all(withText ? 0 : 15),
          height: withText ? 50.h : 60.h,
          width: withText ? 350.w : 60.h,
          decoration: BoxDecoration(
            border: Border.all(color: context.appColors.text.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: withText
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      logoPath,
                      height: 25.h,
                      width: 25.h,
                    ),
                     SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TypographyAppBold.bodyM,
                    ),
                  ],
                )
              : Image.asset(
                  logoPath,
                  height: 40.h,
                  width: 40.h,
                ),
        ),
      ),
    );
  }
}
