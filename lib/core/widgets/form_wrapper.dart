import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import '../util/gen/assets.gen.dart';
import '../util/sizes.dart';
import 'loading_widget.dart';

class FormWrapper extends StatelessWidget {
  const FormWrapper({Key? key, required this.child, this.loading = false})
      : super(key: key);
  final Widget child;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
          decoration: BoxDecoration(color: context.appColors.primary),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 10.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                      tag: Assets.images.logoTitle.path,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            Assets.images.logo,
                            height: 60.h,
                          ),
                        ),
                      )),
                ),
              ),
               SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -8,
                      width: AppSizes.getDeviceWidth(context),
                      child: Container(
                        height: 60.h,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration:  BoxDecoration(
                          color: context.appColors.surface,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration:  BoxDecoration(
                            color: context.appColors.background,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24.r))),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
                          child: child,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (loading)
          Container(
            color: Colors.black26,
            child: const LoadingWidget(),
          )
      ],
    );
  }
}
