import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  const BlurredContainer(
      {Key? key,
      this.margin,
      this.padding,
      this.child,
      this.borderRadius,
      this.color})
      : super(key: key);
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin??EdgeInsets.zero,
      child: ClipRRect(
         borderRadius: borderRadius??BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(color: color),
            child: child,
          ),
        ),
      ),
    );
  }
}
