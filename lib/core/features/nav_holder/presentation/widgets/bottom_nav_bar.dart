import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/util/translator.dart';
import '../../../../theme/app_colors.dart';
import '../nav_holder.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.page, required this.onChange})
      : super(key: key);
  final NavPagesData page;
  final Function(NavPagesData i) onChange;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom ,
      ),
      padding: EdgeInsets.only(
        bottom: 5.h,
      ),
      decoration: BoxDecoration(
        color: context.appColors.background,
        border: Border(top: BorderSide(color: context.appColors.surface)),

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...[NavPagesData.home, NavPagesData.profile]
              .map((e) => _BuildIconButton(
                    onTap: () => onChange(e),
                    bottomNavHelper: e,
                    isActive: page == e,
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class _BuildIconButton extends StatelessWidget {
  const _BuildIconButton({
    Key? key,
    required this.isActive,
    required this.bottomNavHelper,
    required this.onTap,
  }) : super(key: key);

  final bool isActive;
  final NavPagesData bottomNavHelper;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) => Expanded(
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: onTap,
          child: Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: SvgPicture.asset(
                    isActive
                        ? bottomNavHelper.iconSelected
                        : bottomNavHelper.icon,
                    height: 22.h,
                    width: 22.h,
                    color: isActive ? context.appColors.primary : context.appColors.subText,
                  ),
                ),
                Text(
                  bottomNavHelper.title(context),
                  textAlign: TextAlign.center,
                  style: TypographyAppBold.bodyXS
                      .copyWith(color: isActive ? context.appColors.primary : context.appColors.subText),
                )
              ],
            ),
          ),
        ),
      );
}
