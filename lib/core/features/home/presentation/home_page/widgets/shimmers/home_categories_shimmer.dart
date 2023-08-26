import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/util/sizes.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:flutter_template/core/widgets/shimmer/shimmer.dart';

class HomCategoriesShimmer extends StatelessWidget {
  const HomCategoriesShimmer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
        child: Column(
      children: [

         Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  context.tr.myCourses,
                  maxLines: 1,
                  style: TypographyAppBold.heading4,
                ),
              ),
              // TextButton(
              //     onPressed: () => null,
              //     child: const Text(
              //       "View all",
              //       style: TypographyAppBold.bodyM
              //       ,
              //     ),),
            ],
          ),
        ),
         SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: AppSizes.getDeviceHeight(context) / 2.5,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 10),
            itemCount: 6,
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
            itemBuilder: (context, index) => Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                          color: Colors.grey.shade200.withOpacity(0.3),
                        ),
                        child: Container(
                          child: Text(
                            "                 ",
                            maxLines: 1,
                            style: TypographyAppMedium.heading5
                                .copyWith(color: context.appColors.background),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
         SizedBox(
          height: 20.h,
        )
      ],
    ));
  }
}
