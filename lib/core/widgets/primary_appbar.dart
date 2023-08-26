import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/widgets/buttons/primary_back_button.dart';


class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget{
  const PrimaryAppBar({Key? key, required this.title,  this.actions, this.leading,this.height, this.bottom, this.leadingWidth}) : super(key: key);
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final double? height;
  final double? leadingWidth;
  final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height??70.h,
      title: title,
      actions: actions,
      leading: leading ?? (context.canPop()?Padding(
        padding:  EdgeInsetsDirectional.only(start: 10.w,bottom: 5.h,top: 5.h),
        child: const PrimaryBackButton(),
      ):null),
      leadingWidth: leadingWidth??40.w,
      elevation: 0,
      shadowColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor:  Theme.of(context).scaffoldBackgroundColor,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(height??70.h);
}
