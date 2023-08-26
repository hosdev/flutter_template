import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/nav_holder/presentation/nav_holder.dart';

final navHolderViewModelProvider =
    ChangeNotifierProvider<NavHolderViewModel>((ref) {
  return NavHolderViewModel();
});

class NavHolderViewModel extends ChangeNotifier {
  NavPagesData  pagesData = NavPagesData.home;
  void onChangeIndex(NavPagesData i) {
    pagesData = i;
    notifyListeners();
  }
}
