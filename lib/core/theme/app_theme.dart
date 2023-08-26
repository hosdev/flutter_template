import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/util/constans.dart';
import 'app_colors.dart';


//ToDO: Customise App Theme

ThemeData appTheme() {
  final colors = AppColors(false);
  return ThemeData(
    useMaterial3: true,
    primaryColor: colors.primary,
    extensions: <ThemeExtension<dynamic>>[
      AppColors(
        false,
      ),
    ],
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.background,
        surfaceTintColor: colors.background),
    fontFamily: AppConstants.fontEN,
    textTheme: Typography.englishLike2021.apply(bodyColor: colors.text,fontSizeFactor: 1.sp,fontFamily: AppConstants.fontEN),
    scaffoldBackgroundColor: colors.background,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    canvasColor: colors.background,
    dialogBackgroundColor: colors.background,
    inputDecorationTheme: _primaryDecoration(false),
    elevatedButtonTheme: _elevatedButtonThemeData(false),
    outlinedButtonTheme: _outlinedButtonThemeData(false),
    textButtonTheme: _textButtonThemeData,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: colors.primary),
    dialogTheme: _dialogTheme,
    popupMenuTheme: _popupMenuTheme,
    chipTheme: _chipTheme(false),
    sliderTheme: _sliderTheme,
    checkboxTheme: _checkboxTheme,
    switchTheme:
        SwitchThemeData(trackColor: MaterialStatePropertyAll(Colors.black45)),
    dividerTheme: DividerThemeData(color: colors.gray.shade200),
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TypographyAppBold.heading5.copyWith(color: colors.text),
      shadowColor: colors.background,
      backgroundColor: colors.background,
      surfaceTintColor: colors.background,
    ),
  );
}

ThemeData appDarkTheme() {
  final colors = AppColors(true);

  return ThemeData(
    useMaterial3: true,
    primaryColor: colors.primary,
    extensions: <ThemeExtension<dynamic>>[
      AppColors(
        true,
      ),
    ],
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.background,
        surfaceTintColor: colors.background),
    fontFamily: AppConstants.fontEN,
    textTheme: Typography.englishLike2021.apply(bodyColor: colors.text,fontSizeFactor: 1.sp,fontFamily: AppConstants.fontEN),
    scaffoldBackgroundColor: colors.background,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    canvasColor: colors.background,
    dialogBackgroundColor: colors.background,
    inputDecorationTheme: _primaryDecoration(true),
    textButtonTheme: _textButtonThemeData,
    outlinedButtonTheme: _outlinedButtonThemeData(true),
    elevatedButtonTheme: _elevatedButtonThemeData(true),
    chipTheme: _chipTheme(true),
    colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark, primarySwatch: colors.primary),
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TypographyAppBold.heading5,
      shadowColor: colors.background,
      backgroundColor: colors.background,
      surfaceTintColor: colors.background,
    ),
  );
}

final _checkboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));

const _popupMenuTheme =
    PopupMenuThemeData(surfaceTintColor: Colors.white, color: Colors.white);

const _sliderTheme = SliderThemeData(
  showValueIndicator: ShowValueIndicator.always,
  activeTrackColor: Colors.white,
  inactiveTrackColor: Colors.grey,
  trackShape: RectangularSliderTrackShape(),
  trackHeight: 1.0,
  thumbColor: Colors.redAccent,
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
  overlayColor: Colors.grey,
  overlayShape: RoundSliderOverlayShape(overlayRadius: 17.0),
);

ChipThemeData _chipTheme (bool isDark) => ChipThemeData(
    disabledColor: AppColors(isDark).disable,
    surfaceTintColor: AppColors(isDark).surface,
    shadowColor: Colors.transparent,
    side: BorderSide.none,
    elevation: 0,
    labelPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 0));

final _dialogTheme = DialogTheme(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    surfaceTintColor: Colors.white);

ElevatedButtonThemeData _elevatedButtonThemeData (bool isDark) => ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: AppColors(isDark).primary,
    backgroundColor:  AppColors(isDark).surface,
    elevation: 0,
    surfaceTintColor: AppColors(isDark).surface,
    maximumSize:  Size.fromHeight(250.h),
    minimumSize: Size.fromHeight(40.h)

  ),
);

final _textButtonThemeData = TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: AppColors(false).primary,
    textStyle: TypographyAppBold.bodyM,
  ),
);

OutlinedButtonThemeData _outlinedButtonThemeData(bool isDark) =>
    OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 3,
        foregroundColor: AppColors(isDark).primary,
        disabledForegroundColor: AppColors(isDark).primary.withOpacity(0.38),
        side: BorderSide(color: AppColors(isDark).primary),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            ),
      ),
    );

InputDecorationTheme _primaryDecoration(bool isDark) => InputDecorationTheme(
      filled: true,
      fillColor: AppColors(isDark).surface,
      hintStyle:
          TypographyAppRegular.bodyS.copyWith(color: AppColors(isDark).subText),
      labelStyle:
          TypographyAppRegular.bodyS.copyWith(color: AppColors(isDark).subText),
      errorStyle:  TextStyle(fontSize: 10.sp, height: 2),
      contentPadding:
           EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 16.0.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(
          color: AppColors(false).primary,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
    );

final _floatingActionButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: AppColors(false).primary,
  foregroundColor: Colors.white,
  //shape: const CircleBorder(),
);
