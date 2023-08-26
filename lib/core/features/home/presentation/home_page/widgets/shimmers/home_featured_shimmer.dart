import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/util/gen/assets.gen.dart';
import 'package:flutter_template/core/util/sizes.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:flutter_template/core/widgets/shimmer/shimmer.dart';

class HomeFeaturedShimmer extends StatelessWidget {
  const HomeFeaturedShimmer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      context.tr.featured,
                      maxLines: 1,
                      style: TypographyAppBold.heading4,
                    ),
                  ),
                  TextButton(
                      onPressed: () => null,
                      child:  Text(
                        context.tr.viewAll,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              child: CarouselSlider.builder(
                itemBuilder: (context, index, int pageViewIndex) =>
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.8),
                                Colors.grey.withOpacity(0.3)
                              ]),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(30.r)),

                              height: 15,
                              width: 100,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(30.r)),
                              height: 15,
                              width: double.maxFinite,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(30.r)),
                                    height: 15,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      Assets.iconly.lightOutline.heart,
                                      color: Colors.white,
                                      height: 22.h),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                itemCount: 3,
                options: CarouselOptions(
                  height: AppSizes.getDeviceHeight(context) / 2.3,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.25,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
