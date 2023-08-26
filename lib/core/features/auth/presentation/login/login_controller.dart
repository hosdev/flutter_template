import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/user_global_state.dart';
import '../../../../data/api/api_requests.dart';
import '../../../../routing/navigation_controller.dart';
import '../../../nav_holder/presentation/nav_holder.dart';
import '../../models/user_model.dart';

final loginControllerProvider = Provider.autoDispose<LoginController>((ref) {
  return LoginController(ref);
});

class LoginController {
  LoginController(this.ref);
  final Ref ref;

  void login(UserModel userModel) async {
    final globalState = ref.read(userGlobalStateProvider);
    final user = userModel;
    globalState.setToken = user.token;
    globalState.setUserDetails = user.user;
    ref.invalidate(apiControllerProvider);
    ref.read(goRouterProvider).go(NavHolder.path);
  }
}
