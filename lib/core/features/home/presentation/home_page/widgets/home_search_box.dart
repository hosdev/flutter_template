import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/util/gen/assets.gen.dart';
import 'package:flutter_template/core/util/sizes.dart';
import 'package:flutter_template/core/util/translator.dart';

class HomeSearchBox extends StatelessWidget {
  const HomeSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return GestureDetector(
      onTap: () => {
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
        padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
        decoration: BoxDecoration(
          color: context.appColors.surface,
          borderRadius: BorderRadius.circular(15.r)
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.iconly.light.search,
              height: 22.h,
              color: context.appColors.gray.shade400,
            ),
            SizedBox(width: 11.w,),
            Expanded(
                child: Text(
              tr.search,
              style: TypographyAppRegular.bodyM.copyWith(
                color:  context.appColors.gray.shade400
              ),
            )),
            SizedBox(width: 20.w,),

            SvgPicture.asset(
              Assets.iconly.light.filter,
              height: 24.h,
                color: context.appColors.primary
            ),

          ],
        ),
      ),
    );
  }
}
