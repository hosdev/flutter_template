import 'dart:math';

import 'package:flutter/material.dart';

extension ColorOnContext on BuildContext {
  AppColors get appColors {
    return Theme.of(this).extension<AppColors>()!;
  }
}
//ToDO: Add App Colors
class AppColors extends ThemeExtension<AppColors> {
  MaterialColor get primary => isDark
      ? MaterialColorGenerator.from(const Color(0xffc024fd))
      : MaterialColorGenerator.from(const Color(0xffc024fd));
  MaterialColor secondary =
      MaterialColorGenerator.from(const Color(0xff8801f7));
  final MaterialColor gray = Colors.grey;
  final Color disableButton = Color(0xff7f30c8);
  final Color green = Color(0xff39AA2D);
  final Color error = Color(0xffF75555);

  Color get background => isDark ? Color(0xff090810): Colors.white;
  Color get surface => isDark ? Color(0xff1F222A) : Colors.grey.shade100;
  Color get text => isDark ? Colors.white : Color(0xff212121);
  Color get subText => isDark ? Colors.grey : Color(0xff989595);
  Color get disable => isDark ? Colors.grey : Colors.grey;

  final bool isDark;

  AppColors(this.isDark);

  BoxShadow get shadow => BoxShadow(
      color: isDark ? surface.withOpacity(0.5) : Colors.grey.shade200,
      blurRadius: 7,
      spreadRadius: 0.5);

  // Controls how the properties change on theme changes
  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return this;
  }

  AppColors copyWith({
    bool? isDark,
  }) {
    return AppColors(
      isDark ?? this.isDark,
    );
  }
}

class MaterialColorGenerator {
  static MaterialColor from(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
