import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/response/response.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/widgets/buttons/primary_button.dart';
import '../../../../../ui_helper/toast.dart';
import '../../../../../util/sizes.dart';
import '../../../../../widgets/form_fields/input_field.dart';
import '../../../../../widgets/form_wrapper.dart';
import '../forget_password_viewmodel.dart';
import 'check_code_screen.dart';

class EnterEmailForgetScreen extends StatefulWidget {
  const EnterEmailForgetScreen({Key? key}) : super(key: key);
  static String path = "/forget/$subPath";
  static String subPath = "enter_email";

  @override
  State<EnterEmailForgetScreen> createState() => _EnterEmailForgetScreenState();
}

class _EnterEmailForgetScreenState extends State<EnterEmailForgetScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Form(
      key: _formKey,
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(passwordForgetProvider);
            return FormWrapper(
              loading:state.loading,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: context.appColors.primary,
                      foregroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {

                            return context.pop();

                          },
                          icon:  Icon(Icons.arrow_back,size: 24.h,)),
                    ),
                  ),
                  Text(
                    tr.forgotYourPassword,
                    textAlign: TextAlign.center,
                    style: TypographyAppBold.heading2,
                  ),

                  const SizedBox(
                    height: AppSizes.inputFieldSpace,
                  ),
                  PrimaryInputField(
                    initialValue: state.forgetHelper.email,
                    onSaved: (newValue) =>
                    state.forgetHelper.email = newValue ?? "",
                    labelText: tr.email,
                    validatorText: context.tr.emailIsRequired,
                    keyboardType: TextInputType.phone,
                    hintText: "email@email.com",

                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  PrimaryButton(
                      onTap: () async {

                        _formKey.currentState?.save();
                        if (_formKey.currentState?.validate() ?? false) {
                          final result = await state.onSubmitEmail();
                          if (result.status == ApiResStatus.completed && result.data) {
                            if(!mounted) return;
                            context.pushReplacement(CheckCodeScreen.path,);
                          }
                          if(result.status == ApiResStatus.error){
                            ToastHelper.showToast(
                                text: result.message , status: SnakeBarStatus.error);
                          }
                        }
                      },

                      text: context.tr.next)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
