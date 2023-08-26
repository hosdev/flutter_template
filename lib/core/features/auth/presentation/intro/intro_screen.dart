import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/features/auth/presentation/intro/intro_viewmodel.dart';
import 'package:flutter_template/core/features/auth/presentation/login/login_controller.dart';
import 'package:flutter_template/core/features/nav_holder/presentation/nav_holder.dart';
import 'package:flutter_template/core/services/faker.dart';
import 'package:flutter_template/core/theme/app_theme.dart';
import 'package:flutter_template/core/ui_helper/toast.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/features/auth/presentation/login/login_screen.dart';
import 'package:flutter_template/core/features/auth/presentation/register/register_screen.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:flutter_template/core/widgets/blurred_container.dart';
import 'package:flutter_template/core/widgets/buttons/primary_button.dart';
import 'package:flutter_template/core/widgets/buttons/social_button.dart';
import 'package:flutter_template/core/widgets/loading_holder.dart';
import '../../../../response/response.dart';
import '../../../../util/gen/assets.gen.dart';

class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static const path = "/intro";

  @override
  ConsumerState<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Theme(
      data: appDarkTheme(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              Assets.images.loginBg.path,
              fit: BoxFit.cover,
                  alignment: AlignmentDirectional.bottomCenter,
            )),

            SafeArea(
              bottom: false,
              child: Consumer(
                builder: (context, ref, child) {
                  final vm = ref.watch(introStateProvider);
                  return LoadingHolder(
                    loading: vm.loading,
                    child: Align(
                      alignment: AlignmentDirectional.bottomCenter ,
                      child: BlurredContainer(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                tr.introMessage,
                                textAlign: TextAlign.center,
                                style: TypographyAppBold.heading2,
                              ),
                              const SizedBox(
                                height: 25,
                              ),

                              Row(
                                children: [
                                  const Expanded(
                                      child: Divider(
                                    endIndent: 10,
                                    color: Colors.white54,
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      tr.or,
                                      style: TypographyAppSemiBold.bodyL,
                                    ),
                                  ),
                                  const Expanded(
                                      child: Divider(
                                    indent: 10,
                                    color: Colors.white54,
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              PrimaryButton(
                                  onTap: () {
                                    context.push(LoginScreen.path);
                                  },
                                  text: tr.loginWithEmail),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(tr.dontHaveAnAccount,
                                      style: TypographyAppBold.bodyM),
                                  TextButton(
                                      onPressed: () {
                                        context.push(RegisterScreen.path);
                                      },
                                      child: Text(tr.signUp,
                                          style: TypographyAppBold.bodyM
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: context
                                                      .appColors.primary)))
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}
