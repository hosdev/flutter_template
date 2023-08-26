import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/auth/presentation/app_init/app_init_screen.dart';
import 'package:flutter_template/core/features/auth/presentation/intro/intro_screen.dart';
import 'package:flutter_template/core/features/auth/presentation/login/login_screen.dart';
import 'package:flutter_template/core/features/auth/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter_template/core/features/auth/presentation/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/features/auth/presentation/splash/splash_screen.dart';
import 'package:flutter_template/core/features/nav_holder/presentation/nav_holder.dart';
import '../features/auth/presentation/forget_password/screens/check_code_screen.dart';
import '../features/auth/presentation/forget_password/screens/enter_email_screen.dart';
import '../features/auth/presentation/forget_password/screens/reset_password_screen.dart';
import '../features/auth/presentation/forget_password/screens/reset_success_screen.dart';



final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: SplashScreen.path,
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.path,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: IntroScreen.path,
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        path: AppInitScreen.path,
        builder: (context, state) => const AppInitScreen(),
      ),
      GoRoute(
        path: OnBoardingPage.path,
        builder: (context, state) => const OnBoardingPage(),
      ),
      GoRoute(
        path: LoginScreen.path,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
      ),
      GoRoute(
        path: RegisterScreen.path,
        builder: (BuildContext context, GoRouterState state) =>
            const RegisterScreen(),
      ),
      GoRoute(
        path: EnterEmailForgetScreen.path,
        builder: (BuildContext context, GoRouterState state) =>
            const EnterEmailForgetScreen(),
      ),
      GoRoute(
        path: CheckCodeScreen.path,
        builder: (BuildContext context, GoRouterState state) =>
            const CheckCodeScreen(),
      ),
      GoRoute(
        path: ResetPasswordScreen.path,
        builder: (BuildContext context, GoRouterState state) =>
            const ResetPasswordScreen(),
      ),
      GoRoute(
        path: ResetSuccessScreen.path,
        builder: (BuildContext context, GoRouterState state) =>
            const ResetSuccessScreen(),
      ),
      GoRoute(
          path: NavHolder.path,
          builder: (BuildContext context, GoRouterState state) =>
              const NavHolder(),
          routes:[]),
    ],
    debugLogDiagnostics: true,
  );
});
