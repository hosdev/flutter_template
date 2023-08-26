import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/auth/models/user_details.dart';
import '../data/cache/shared_prefs.dart';


final userGlobalStateProvider = ChangeNotifierProvider<UserGlobalState>((ref) {
  return UserGlobalState();
});

class UserGlobalState extends ChangeNotifier {
  String? _token ;
  String? get token => _token;
  set setToken(String value) {
    CacheManager.setString(CacheManager.token,value);
    _token = value;
  }

  bool get isAuthed => _token!=null;


  UserDetails? _userDetails;
  UserDetails? get userDetails => _userDetails;
  set setUserDetails(UserDetails value) {
    _userDetails = value;
    notifyListeners();
  }

  void logout(){
    CacheManager.remove(CacheManager.token);
    _token = null;
    _userDetails = null;
  }
}



