import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/features/auth/presentation/forget_password/screens/reset_success_screen.dart';
import 'package:flutter_template/core/response/response.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/widgets/buttons/primary_button.dart';
import '../../../../../ui_helper/toast.dart';
import '../../../../../util/sizes.dart';
import '../../../../../widgets/form_fields/input_field.dart';
import '../../../../../widgets/form_wrapper.dart';
import '../forget_password_viewmodel.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  static String path = "/forget/$subPath";
  static String subPath = "reset";

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Form(
      key: _formKey,
      child: Scaffold(body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(passwordForgetProvider);
          return FormWrapper(
            loading: state.loading,
            child: Column(
              children: [
                const SizedBox(
                  height: AppSizes.inputFieldSpace,
                ),
                Text(
                  tr.resetYourPassword,
                  textAlign: TextAlign.center,
                  style: TypographyAppBold.heading2,
                ),
                const SizedBox(
                  height: AppSizes.inputFieldSpace,
                ),
                PrimaryInputField(
                  labelText: tr.newPassword,
                  obscureText: state.hidePassword,
                  initialValue: state.forgetHelper.password,
                  onSaved: (newValue) =>
                      state.forgetHelper.password = newValue ?? "",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return tr.passwordIsRequired;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: '*********',
                    suffixIcon: IconButton(
                        onPressed: state.hidePasswordSet,
                        icon: Icon(
                          state.hidePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                        )),
                  ),
                ),
                PrimaryInputField(
                  labelText: tr.repeatPassword,
                  obscureText: state.hidePassword,
                  initialValue: state.forgetHelper.confirmPassword,
                  onSaved: (newValue) =>
                      state.forgetHelper.confirmPassword = newValue ?? "",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return tr.passwordIsRequired;
                    }
                    if (value != state.forgetHelper.confirmPassword) {
                      return tr.passwordsDoNotMatch;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: '*********',
                    suffixIcon: IconButton(
                        onPressed: state.hidePasswordSet,
                        icon: Icon(
                          state.hidePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                PrimaryButton(
                  onTap: () async {
                    _formKey.currentState?.save();
                    if (_formKey.currentState?.validate() ?? false) {
                      final result = await state.onSubmitNewPassword();
                      if (result.status == ApiResStatus.completed &&
                          result.data) {
                        if (!mounted) return;
                        context.go(
                          ResetSuccessScreen.path,
                        );
                      }
                      if (result.status == ApiResStatus.error) {
                        ToastHelper.showToast(
                            text: result.message, status: SnakeBarStatus.error);
                      }
                    }
                  },
                  text: tr.resetPassword,
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
