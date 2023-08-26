import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/features/auth/presentation/login/login_screen.dart';
import 'package:flutter_template/core/features/auth/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter_template/core/services/notifications.dart';
import '../../../../data/cache/shared_prefs.dart';
import '../../../../response/response.dart';
import '../../../../services/user_global_state.dart';
import '../../../nav_holder/presentation/nav_holder.dart';
import '../intro/intro_screen.dart';
import 'app_init_provider.dart';

class AppInitScreen extends ConsumerStatefulWidget {
  static const path = "/app_init";

  const AppInitScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<AppInitScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      initApp();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(),
          )
        ],
      ),
    );
  }

  void initApp() async {
    try {
      final token = CacheManager.getString(CacheManager.token);
      if (token == null) {
        if (mounted) {
          context.go(OnBoardingPage.path);
        }
      } else {
        final stateGlobal = ref.read(userGlobalStateProvider);
        stateGlobal.setToken = token;

        final user = await ref.read(appInitProvider).getDetails();
        if (user.status == ApiResStatus.error) {
          if (mounted) context.go(LoginScreen.path);
          return;
        }

        stateGlobal.setUserDetails = user.data;
        if (mounted) {
          return context.go(NavHolder.path);
        }
      }
    } catch (e) {
      if (mounted) context.go(LoginScreen.path);
    }
  }
}
