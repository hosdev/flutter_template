import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/features/home/models/banner_model.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/util/sizes.dart';
import 'package:flutter_template/core/widgets/shimmer/shimmer.dart';

class HomeBannerShimmer extends StatelessWidget {
  const HomeBannerShimmer({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Column(
        children: [
          SizedBox(
            height: AppSizes.getDeviceHeight(context)/5,
            child:    Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: AppSizes.bodyPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
           SizedBox(
            height: 10.h,
          ),
          Wrap(
            spacing: 8,
            children: List.generate(
              3,
              (index) => buildAnimatedDot(index,context),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildAnimatedDot(int i,BuildContext context) => AnimatedContainer(
        decoration: BoxDecoration(
          color: 0 == i ? context.appColors.secondary : Colors.grey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.r),
        ),
        duration: const Duration(milliseconds: 200),
        height: 3.h,
        width: 30.w,
      );
}


