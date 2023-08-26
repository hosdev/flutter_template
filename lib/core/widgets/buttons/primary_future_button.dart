import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/theme/app_colors.dart';

import '../../theme/text_theme.dart';

class PrimaryFutureButton extends StatefulWidget {
  const PrimaryFutureButton(
      {Key? key,
        required this.onTap,
        required this.text,
        this.padding = 20,
        this.color})
      : super(key: key);

  final Future Function()  onTap;
  final String text;
  final double padding;
  final Color? color;

  @override
  State<PrimaryFutureButton> createState() => _PrimaryFutureButtonState();
}

class _PrimaryFutureButtonState extends State<PrimaryFutureButton> {
  bool _loading = false;

  set loading(bool value) {
    if (mounted) {
      setState(() {
        _loading = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: GestureDetector(
        onTap: () async {
          HapticFeedback.lightImpact();
          loading = true;
          await widget.onTap();
          loading = false;
        },
        child: AnimatedContainer(
          curve: Curves.easeInOutQuad,
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.all(2),
          height: 50.h,
          width: 350.w,
          decoration: BoxDecoration(
              color: widget.color ?? (context.appColors.primary),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(color: context.appColors.primary.shade200,blurRadius: 0,spreadRadius: 0)
              ]),
          child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TypographyAppBold .bodyM.copyWith(color:Colors.white),
              )),
        ),
      ),
    );
  }
}