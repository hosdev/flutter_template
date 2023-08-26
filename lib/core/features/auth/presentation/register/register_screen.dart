import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/features/auth/presentation/register/pages/password_register_fields.dart';
import 'package:flutter_template/core/features/auth/presentation/register/pages/personal_info_register_fields.dart';
import 'package:flutter_template/core/features/auth/presentation/register/register_viewmodel.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:flutter_template/core/services/user_global_state.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'package:flutter_template/core/widgets/form_wrapper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String path = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final pages = [
    const PersonalInfoRegisterFields(),
    const PasswordRegisterFields(),
  ];

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(registerStateProvider);
          return WillPopScope(
            onWillPop: () async {
              if (state.indexPage == 0) {
                return true;
              }
              state.onPreviousPage();
              return false;
            },
            child: FormWrapper(
              loading: state.loading,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: context.appColors.primary,
                              foregroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: () {
                                    if (state.indexPage == 0) {
                                      return context.pop();
                                    }
                                    state.onPreviousPage();
                                  },
                                  icon:  Icon(Icons.arrow_back,size: 24.h,)),
                            ),
                          ),
                        ),
                        Text(
                          tr.signUpToApp,
                          textAlign: TextAlign.center,
                          style: TypographyAppBold.heading4,
                        ),
                        Spacer()
                      ],
                    ),

                    const SizedBox(height: 24),
                    pages[state.indexPage],
                    const SizedBox(height: 24),
                  ],
                )),
          );
        },
      ),
    );
  }
}
