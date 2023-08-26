import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/features/auth/presentation/intro/intro_screen.dart';
import 'package:flutter_template/core/features/auth/presentation/login/login_screen.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import '../../../../../util/gen/assets.gen.dart';
import '../../../../../util/sizes.dart';
import '../../../../../widgets/buttons/primary_button.dart';
import '../forget_password_viewmodel.dart';

class ResetSuccessScreen extends StatefulWidget {
   const ResetSuccessScreen({Key? key}) : super(key: key);
  static String path = "/forget/$subPath";
  static String subPath = "reset_success";

  @override
  State<ResetSuccessScreen> createState() => _ResetSuccessScreenState();
}

class _ResetSuccessScreenState extends State<ResetSuccessScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.primary,
        body: Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(passwordForgetProvider);
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),

          child: Column(
            children: [
              SizedBox(height: AppSizes.getDeviceHeight(context) / 7,),
              Center(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                          tag: Assets.images.logo,
                          child: SvgPicture.asset(
                            Assets.images.logo,
                            height: 140,
                          )),
                      SizedBox(height: 15,),

                    ],
                  )),

              const SizedBox(
                height: 35,
              ),
              const Text(
                "Password reset successfully",
                textAlign: TextAlign.center,

              ),

              const SizedBox(
                height: 40,
              ),
              PrimaryButton(
                  isLoading: state.loading,
                  onTap: () async {
                    context.go(LoginScreen.path,);
                  },
                  text: "Back to login")
            ],
          ),
        );
      },
    ));
  }
}



