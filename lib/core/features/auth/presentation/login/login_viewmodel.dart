import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/auth/models/user_model.dart';
import 'package:flutter_template/core/features/auth/repositories/auth_repository_imp.dart';
import 'package:flutter_template/core/response/response.dart';
import '../../../../data/api/api_requests.dart';
import '../../repositories/auth_repository.dart';
import '../../models/login_params.dart';




final loginStateProvider = ChangeNotifierProvider<LoginViewModel>((ref) {
  final apiController = ref.read(apiControllerProvider);

  return LoginViewModel(AuthAppRepositoryImpl(remoteDataSource: apiController));
});

class LoginViewModel extends ChangeNotifier {
  final AuthAppRepository repository;

  LoginViewModel(this.repository);

  LoginParams loginHelper=LoginParams();
  bool loading=false;
  bool hidePassword=true;


  Future<AppResponse<UserModel>> onLogin()async{
    setLoading=true;
    final result=  await repository.onLogin(await  loginHelper.toJsonBody()) ;
    setLoading=false;
    return result;
  }



  void hidePasswordSet() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  set setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

}

