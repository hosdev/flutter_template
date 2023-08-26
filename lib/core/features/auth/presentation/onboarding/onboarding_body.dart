import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/core/features/auth/models/onboarding_model.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/util/gen/assets.gen.dart';
import 'package:flutter_template/core/util/sizes.dart';
import 'package:flutter_template/core/util/translator.dart';

import '../../../../widgets/buttons/primary_button.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({Key? key, required this.list, required this.onDone})
      : super(key: key);
  final List<OnboardingModel> list;
  final void Function() onDone;

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Expanded(
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _pageIndex = value;
              });
            },
            itemCount: widget.list.length,
            controller: _pageController,
            itemBuilder: (context, index) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: CachedNetworkImage(
                    imageUrl: widget.list[index].image,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )),
                  Text(
                    widget.list[index].title.toString(),
                    style: TypographyAppBold.heading3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 8,
          children: List.generate(
              widget.list.length, (index) => buildAnimatedDot(index)),
        ),
        const SizedBox(
          height: 30,
        ),
        PrimaryButton(
            onTap: () => _onNext(),
            text:
                _pageIndex >= widget.list.length - 1 ? tr.getStarted : tr.next),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  void _onNext() {
    if (_pageIndex >= widget.list.length - 1) {
      widget.onDone();
    } else {
      setState(() {
        ++_pageIndex;
      });
      _pageController.animateToPage(_pageIndex,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate);
    }
  }

  AnimatedContainer buildAnimatedDot(int i) => AnimatedContainer(
        decoration: BoxDecoration(
          color: _pageIndex == i
              ? context.appColors.secondary
              : context.appColors.gray.shade300,
          borderRadius: BorderRadius.circular(100),
        ),
        duration: const Duration(milliseconds: 200),
        height: 8,
        width: _pageIndex == i ? 30 : 8,
      );
}
