import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/features/auth/presentation/app_init/app_init_screen.dart';
import '../../../../util/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  static const path="/";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
     initApp();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Image.asset(
              Assets.images.logoTitle.path,
              height: 50,
            )),
        decoration: BoxDecoration(
        ),
      ),
    );
  }

  void initApp() async {
    await Future.delayed(Duration(seconds: 2));
    context.go(AppInitScreen.path);
  }
}
