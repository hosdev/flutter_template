import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/features/home/models/banner_model.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/util/sizes.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({
    Key? key,
    required this.cards,
  }) : super(key: key);

  final List<BannerModel> cards;

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: AppSizes.getDeviceHeight(context)/5,
            child: PageView(
              scrollDirection: Axis.horizontal,
              //     clipBehavior: Clip.none,
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              padEnds: false,
              controller: PageController(viewportFraction: 1),
              children: widget.cards.map((e) => BannerCard(bannerModel: e)).toList(),
            ),
          ),
           SizedBox(
            height: 10.h,
          ),
          Wrap(
            spacing: 8,
            children: List.generate(
              widget.cards.length,
              (index) => buildAnimatedDot(index),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildAnimatedDot(int i) => AnimatedContainer(
        decoration: BoxDecoration(
          color: pageIndex == i ? context.appColors.secondary : Colors.grey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.r),
        ),
        duration: const Duration(milliseconds: 200),
        height: 3.h,
        width: 30.w,
      );
}

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
    required this.bannerModel,
  }) : super(key: key);
  final BannerModel bannerModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (bannerModel.link!=null)?() => launchUrlString(bannerModel.link!,mode: LaunchMode.externalNonBrowserApplication):null,
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: AppSizes.bodyPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: CachedNetworkImage(
          imageUrl: bannerModel.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
