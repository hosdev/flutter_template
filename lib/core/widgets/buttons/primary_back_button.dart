import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/theme/app_colors.dart';

import '../../util/gen/assets.gen.dart';

class PrimaryBackButton extends StatelessWidget {
  const PrimaryBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      child: SvgPicture.asset(
        Directionality.of(context) == TextDirection.rtl
            ? Assets.iconly.lightOutline.arrowRight
            : Assets.iconly.lightOutline.arrowLeft,
        height: 24.h,
        width: 24.h,
        color: context.appColors.text,
      ),
    );
  }
}
