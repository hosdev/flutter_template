import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/auth/presentation/login/login_controller.dart';
import 'package:flutter_template/core/features/auth/presentation/login/login_viewmodel.dart';
import 'package:flutter_template/core/features/auth/presentation/login/widgets/login_body.dart';
import 'package:flutter_template/core/features/auth/presentation/social_login/presentation/social_login_viewmodel.dart';
import 'package:flutter_template/core/response/response.dart';
import 'package:flutter_template/core/theme/app_theme.dart';
import 'package:flutter_template/core/ui_helper/toast.dart';

import '../../../../util/gen/assets.gen.dart';
import '../../../../widgets/blurred_container.dart';
import '../../../../widgets/loading_holder.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String path = "/signin";

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appDarkTheme(),
      child: Scaffold(
        body:   Stack(
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

                  return Align(
                    alignment: AlignmentDirectional.bottomCenter ,
                    child: BlurredContainer(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: LoginBody(
                          onLogin: onLogin,

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

  void onLogin() async {
    final loginState = ref.read(loginStateProvider);
    final result = await loginState.onLogin();
    if (result.status == ApiResStatus.error) {
      ToastHelper.showToast(
          text: result.message.toString(), status: SnakeBarStatus.error);
    }
    if (result.status == ApiResStatus.completed) {
      ref.read(loginControllerProvider).login(result.data);
    }
  }


}
