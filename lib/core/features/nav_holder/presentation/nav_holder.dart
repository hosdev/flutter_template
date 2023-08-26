import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/home/presentation/home_page/home_page.dart';
import 'package:flutter_template/core/features/nav_holder/presentation/nav_holder_viewmodel.dart';
import 'package:flutter_template/core/features/nav_holder/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter_template/core/services/notifications.dart';
import 'package:flutter_template/core/util/translator.dart';
import '../../../theme/app_theme.dart';
import '../../../util/gen/assets.gen.dart';

class NavHolder extends ConsumerStatefulWidget {
  const NavHolder({Key? key}) : super(key: key);
  static String path = "/root_app";

  @override
  ConsumerState<NavHolder> createState() => _NavHolderState();
}

class _NavHolderState extends ConsumerState<NavHolder> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(navHolderViewModelProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldState,
      body: AnimatedSwitcher(
        duration: const Duration(
          milliseconds: 400,
        ),
        child: pageByTab(vm.pagesData),
      ),
      bottomNavigationBar:
          BottomNavBar(page: vm.pagesData, onChange: (i) =>vm.onChangeIndex(i),),
    );
  }

  Widget pageByTab(NavPagesData data) {
    switch (data) {
      case NavPagesData.home:
        return const HomePage();

      case NavPagesData.profile:
        return const SizedBox();
    }
  }
}

enum NavPagesData {
  home,
  profile;

  String title(BuildContext context) {
    final tr = context.tr;
    switch (this) {
      case NavPagesData.home:
        return tr.home;

      case NavPagesData.profile:
        return tr.myProfile;
    }
  }

  String get icon {
    switch (this) {
      case NavPagesData.home:
        return Assets.iconly.light.home;
      case NavPagesData.profile:
        return Assets.iconly.light.profile;
    }
  }

  String get iconSelected {
    switch (this) {
      case NavPagesData.home:
        return Assets.iconly.bold.home;
      case NavPagesData.profile:
        return Assets.iconly.bold.profile;
    }
  }
}
