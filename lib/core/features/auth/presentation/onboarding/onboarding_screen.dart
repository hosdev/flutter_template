import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/features/auth/presentation/intro/intro_screen.dart';
import 'package:flutter_template/core/features/auth/presentation/login/login_screen.dart';
import 'package:flutter_template/core/features/auth/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/widgets/primary_future_builder.dart';

import 'onboarding_body.dart';

class OnBoardingPage extends ConsumerStatefulWidget {
  const OnBoardingPage({
    Key? key,
  }) : super(key: key);
  static const path = "/onboarding";

  @override
  ConsumerState createState() => _OnBoardingState();
}

class _OnBoardingState extends ConsumerState<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.appColors.background,
        body: Consumer(
          builder: (context, ref, child) {
            final vm = ref.watch(onBoardingVMProvider);
            return SafeArea(
              child: PrimaryFutureBuilder(
                controller: vm.futureController,
                successBuilder: (data) =>
                    OnboardingBody(list: data, onDone: onDone),
              ),
            );
          },
        ));
  }

  void onDone() {
    context.go(LoginScreen.path);
  }
}
