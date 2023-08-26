import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/features/auth/presentation/forget_password/screens/reset_password_screen.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/util/sizes.dart';
import 'package:flutter_template/core/widgets/buttons/primary_button.dart';
import '../../../../../util/translator.dart';
import '../../../../../widgets/form_fields/input_field.dart';
import '../../../../../widgets/form_wrapper.dart';
import '../forget_password_viewmodel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CheckCodeScreen extends StatefulWidget {
   const CheckCodeScreen({Key? key}) : super(key: key);
  static String path = "/forget/$subPath";
  static String subPath = "check_code";

  @override
  State<CheckCodeScreen> createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends State<CheckCodeScreen> {
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
                loading: state.loading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppSizes.inputFieldSpace,
                    ),
                    Text(
                      tr.enterSendedCode + " (${state.forgetHelper.email})",
                      textAlign: TextAlign.center,
                      style: TypographyAppBold.heading2,
                    ),
                    const SizedBox(
                      height: AppSizes.inputFieldSpace,
                    ),


                    PrimaryInputField(
                      initialValue: state.forgetHelper.code,
                      onSaved: (newValue) =>
                      state.forgetHelper.code = newValue ?? "",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.tr.pleaseAnswer;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      hintText: "XXXXXX",

                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    PrimaryButton(
                      onTap: () async {
                        _formKey.currentState?.save();
                        if (_formKey.currentState?.validate() ?? false) {
                          context.pushReplacement(ResetPasswordScreen.path,);

                          // final result = await state.onSubmitCode();
                          // if (result.status == ApiResStatus.completed && result.data) {
                          //   if(!mounted)return;
                          //
                          // }
                          // if(result.status == ApiResStatus.error){
                          //   UiMethods.showSnackBar(
                          //       text: result.message , status: SnakeBarStatus.error);
                          // }
                        }
                      }, text: tr.next,)
                  ],
                ),
              );
            },
          )),
    );
  }
}



class _PinTextField extends StatelessWidget {
  const _PinTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer(

      builder:(context, ref, child) {
        final state = ref.watch(passwordForgetProvider);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: PinCodeTextField(

              length: 6,
              scrollPadding: const EdgeInsets.all(0),
              appContext: context,
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty||value.length<6) {
                  return "Please enter the code";
                }
                return null;
              },
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor:context.appColors.primary,
                selectedColor: context.appColors.primary,
                disabledColor: context.appColors.text,
                inactiveColor: context.appColors.text,
                fieldOuterPadding:const EdgeInsets.symmetric(horizontal: 3),
                errorBorderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                borderWidth: 1,
                fieldHeight: MediaQuery.of(context).size.width/10.5,
                fieldWidth: MediaQuery.of(context).size.width/10.5,
                activeFillColor: Colors.grey.shade100,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onCompleted: (value) {state.forgetHelper.code=value;},
              onChanged: (value) => state.forgetHelper.code=value,
              onSaved: (value) =>state.forgetHelper.code=value??'',
              beforeTextPaste: (text) {
                return true;
              },
            ),
          ),
        );
      },
    );
  }
}
