import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/user_global_state.dart';
import 'package:flutter_template/core/widgets/form_fields/date_picker_card.dart';
import 'package:flutter_template/core/widgets/form_fields/dropdown_field.dart';
import 'package:flutter_template/core/widgets/primary_future_builder.dart';
import '../../../../../util/translator.dart';
import '../../../../../util/sizes.dart';
import '../../../../../widgets/form_fields/input_field.dart';
import '../../../../../widgets/buttons/primary_button.dart';
import '../register_viewmodel.dart';

class PersonalInfoRegisterFields extends StatefulWidget {
  const PersonalInfoRegisterFields({Key? key}) : super(key: key);

  @override
  State<PersonalInfoRegisterFields> createState() =>
      _PersonalInfoRegisterFieldsState();
}

class _PersonalInfoRegisterFieldsState
    extends State<PersonalInfoRegisterFields> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Consumer(
      builder: (context, ref, child) {
        final registerState = ref.watch(registerStateProvider);
        final userGlobalState = ref.watch(userGlobalStateProvider);
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
                    labelText: tr.fullName,
                    initialValue: registerState.registerParams.name,
                    textDirection: TextDirection.ltr,
                    onSaved: (newValue) =>
                    registerState.registerParams.name = newValue ?? '',
                    keyboardType: TextInputType.name,
                    validatorText: tr.nameIsRequired,
                  ),
                  PrimaryInputField(
                    labelText: tr.email,
                    initialValue: registerState.registerParams.email,
                    textDirection: TextDirection.ltr,
                    onSaved: (newValue) =>
                    registerState.registerParams.email = newValue ?? '',
                    keyboardType: TextInputType.emailAddress,
                    validatorText: tr.emailIsRequired,
                  ),
                  PrimaryInputField(
                      labelText: tr.phoneNumber,
                      initialValue: registerState.registerParams.phone,
                      textDirection: TextDirection.ltr,
                      onSaved: (newValue) =>
                      registerState.registerParams.phone = newValue ?? '',
                      keyboardType: TextInputType.phone,
                      validatorText: tr.phoneIsRequired,
                      ),


                  const SizedBox(
                    height: AppSizes.inputFieldSpace,
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onTap: () async {
                formKey.currentState?.save();
                if (formKey.currentState?.validate() ?? false) {
                  registerState.onNextPage();
                }
              },
              text: tr.next,
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
