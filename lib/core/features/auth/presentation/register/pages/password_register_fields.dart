import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import '../../../../../util/translator.dart';
import '../../../../../util/sizes.dart';
import '../../../../../widgets/form_fields/input_field.dart';
import '../../../../../widgets/buttons/primary_button.dart';
import '../register_controller.dart';
import '../register_viewmodel.dart';

class PasswordRegisterFields extends StatefulWidget {
  const PasswordRegisterFields({Key? key}) : super(key: key);

  @override
  State<PasswordRegisterFields> createState() => _PasswordRegisterFieldsState();
}

class _PasswordRegisterFieldsState extends State<PasswordRegisterFields> {
  final formKey = GlobalKey<FormState>();
  bool validateForm() {
    formKey.currentState?.save();
    return formKey.currentState?.validate() ?? false;
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tr = context.tr;

    return Consumer(
      builder: (context, ref, child) {
        final registerState = ref.watch(registerStateProvider);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSizes.inputFieldSpace),
                  PrimaryInputField(
                    //textDirection: TextDirection.ltr,

                    obscureText: registerState.hidePassword,
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (newValue) =>
                    registerState.registerParams.password = newValue ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return tr.passwordIsRequired;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: tr.password,

                      suffixIcon: IconButton(
                          onPressed: registerState.hidePasswordSet,
                          icon: Icon(
                            registerState.hidePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20.h,
                          )),
                    ),
                  ),

                  PrimaryInputField(
                    //textDirection: TextDirection.ltr,

                    obscureText: registerState.hidePassword,
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (newValue) => registerState
                        .registerParams.passwordRepeated = newValue ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return tr.passwordIsRequired;
                      }
                      if (value != registerState.registerParams.passwordRepeated) {
                        return tr.passwordsDoNotMatch;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: tr.repeatPassword,
                      suffixIcon: IconButton(
                          onPressed: registerState.hidePasswordSet,
                          icon: Icon(
                            registerState.hidePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20.h,
                          )),
                    ),
                  ),

                ],
              ),
            ),
            CheckboxListTile(
              value: registerState.agreeTerms,
              contentPadding: EdgeInsets.zero,
              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4) ),
              checkColor: Colors.white,
              onChanged: (value) => registerState.setTerms = value ?? false,
              title: Text(
               tr.iAgreeWithTermsAndConditions,
                style: TypographyAppRegular.bodyS.copyWith(color: context.appColors.text),
              ),
            ),
            const SizedBox(
              height: AppSizes.inputFieldSpace,
            ),
            PrimaryButton(
              onTap: () async {
                if (!validateForm()) {
                  return;
                }
                ref.read(registerControllerProvider).register();
              },
              text: tr.register,
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
