import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/routing/navigation_controller.dart';
import 'package:flutter_template/core/services/user_global_state.dart';
import 'package:flutter_template/core/util/constans.dart';
import 'core/data/cache/shared_prefs.dart';
import 'core/services/device_preferences.dart';
import 'core/theme/app_theme.dart';
import 'core/util/gen/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // cc.DefaultCacheManager().emptyCache();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await CacheManager.init();
 // await Firebase.initializeApp();
  runApp(RestartWidget(
      child: ProviderScope(
        overrides: [
          settingProvider.overrideWith((ref) => DevicePreferences()
            ..getLang()
            ..getTheme())
        ],
        child: ScreenUtilInit(
            designSize: const Size(400, 800),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => const MyApp()),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final router = ref.watch(goRouterProvider);
        final setting = ref.watch(settingProvider);
        final userGlobalState = ref.watch(userGlobalStateProvider);
        return MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          themeMode: setting.themeMode,
          locale: setting.locale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          //  scaffoldMessengerKey: snackBarKey,
          theme: appTheme(),
          darkTheme: appDarkTheme(),
        );
      },
    );
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<RestartWidgetState>()?.restartApp();
  }

  @override
  RestartWidgetState createState() => RestartWidgetState();
}

class RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
