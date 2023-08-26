import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/features/auth/presentation/forget_password/screens/enter_email_screen.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/util/gen/assets.gen.dart';
import 'package:flutter_template/core/util/sizes.dart';
import 'package:flutter_template/core/widgets/buttons/primary_button.dart';
import 'package:flutter_template/core/widgets/buttons/social_button.dart';
import '../../../../../widgets/form_fields/input_field.dart';
import '../../../../nav_holder/presentation/nav_holder.dart';
import '../../register/register_screen.dart';
import '../login_viewmodel.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
    required this.onLogin,
  }) : super(key: key);

  final Function onLogin;


  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final formKey = GlobalKey<FormState>();

  bool validateForm() {
    formKey.currentState?.save();
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Consumer(
      builder: (context, ref, child) {
        final loginState = ref.watch(loginStateProvider);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr.logIntoYourAccount,
                textAlign: TextAlign.center,
                style: TypographyAppBold.heading3,
              ),
               SizedBox(
                height: 20.h,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryInputField(
                      textDirection: TextDirection.ltr,
                      onSaved: (newValue) =>
                          loginState.loginHelper.email = newValue ?? '',
                      keyboardType: TextInputType.emailAddress,
                      validatorText: tr.emailIsRequired,
                      hintText: 'example@example.com',
                      decoration: InputDecoration(
                        labelText: tr.email,
                        prefixIcon: const Icon(Icons.alternate_email),
                      ),
                    ),
                    PrimaryInputField(
                      //textDirection: TextDirection.ltr,

                      obscureText: loginState.hidePassword,
                      keyboardType: TextInputType.visiblePassword,
                      onSaved: (newValue) =>
                          loginState.loginHelper.password = newValue ?? '',
                      validatorText: tr.passwordIsRequired,
                      hasBottomPadding: false,
                      hintText: "*********",
                      decoration: InputDecoration(
                        labelText: tr.password,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                            onPressed: loginState.hidePasswordSet,
                            icon: Icon(
                              loginState.hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () =>
                              context.push(EnterEmailForgetScreen.path),
                          child: Text(
                            tr.forgotYourPassword,style: TypographyAppMedium.bodyS.copyWith(color: context.appColors.subText),
                          )),
                    ),
                     SizedBox(
                      height: AppSizes.inputFieldSpace.h,
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                isLoading: loginState.loading,
                onTap: () {
                  if (validateForm()) {
                    widget.onLogin.call();
                  }
                },
                text: tr.login,
                padding: 0,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(tr.dontHaveAnAccount,
                      style: TypographyAppBold.bodyM.copyWith(color: context.appColors.subText)),
                  TextButton(
                      onPressed: () {
                        context.push(RegisterScreen.path);
                      },
                      child: Text(tr.signUp,
                          style: TypographyAppBold.bodyM.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.appColors.primary)))
                ],
              ),
               SizedBox(height: 15.h),


            ],
          ),
        );
      },
    );
  }
}
