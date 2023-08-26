import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/auth/presentation/login/login_screen.dart';
import 'package:flutter_template/core/features/auth/presentation/register/register_viewmodel.dart';
import 'package:flutter_template/core/response/response.dart';
import 'package:flutter_template/core/routing/navigation_controller.dart';
import 'package:flutter_template/core/services/device_preferences.dart';
import 'package:flutter_template/core/services/user_global_state.dart';
import '../../../../data/api/api_requests.dart';
import '../../../../services/notifications.dart';
import '../../../../ui_helper/toast.dart';
import '../../../../util/enums.dart';

final registerControllerProvider =
    Provider.autoDispose<RegisterController>((ref) {
  return RegisterController(ref);
});

class RegisterController {
  RegisterController(this.ref);
  final Ref ref;

  void register() async {
    final registerState = ref.read(registerStateProvider);
    final userGlobalState = ref.read(userGlobalStateProvider);
    final setting = ref.read(settingProvider);
    final result = await registerState.onRegister(
      setting.locale.languageCode,
      await FCM.getToken(),
    );
    if (result.status == ApiResStatus.error) {
      ToastHelper.showToast(
          text: result.message.toString(), status: SnakeBarStatus.error);
    }
    if (result.status == ApiResStatus.completed) {
      ToastHelper.showToast(
          text: result.message.toString(), status: SnakeBarStatus.success);
      userGlobalState.setToken = result.data.token;
      userGlobalState.setUserDetails = result.data.user;
      ref.invalidate(apiControllerProvider);
      ref.read(goRouterProvider).go(LoginScreen.path);
    }
  }
}
