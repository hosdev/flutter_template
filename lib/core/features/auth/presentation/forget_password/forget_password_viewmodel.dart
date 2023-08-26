import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/response/response.dart';
import '../../../../data/api/api_requests.dart';
import '../../models/forget_params.dart';
import '../../repositories/auth_repository_imp.dart';

final passwordForgetProvider =
    ChangeNotifierProvider.autoDispose<PasswordForgetState>((ref) {
      final apiController = ref.read(apiControllerProvider);

      return PasswordForgetState(
      authRepository: AuthAppRepositoryImpl(remoteDataSource: apiController),
      );
});

class PasswordForgetState extends ChangeNotifier {
  PasswordForgetState({required this.authRepository});
  final AuthAppRepositoryImpl authRepository;
  ForgetHelper forgetHelper=ForgetHelper();

  bool loading = false;
  set setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  bool hidePassword = true;
  void hidePasswordSet() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  Future<AppResponse<bool>> onSubmitNewPassword() async {
    setLoading = true;
    final result = await authRepository.forgetPassChange(
     {
          'email': forgetHelper.email,
          'password': forgetHelper.password,
          'password_confirmation': forgetHelper.confirmPassword,
          'code': forgetHelper.code,
        },
        );
    setLoading = false;
    return result;
  }

  Future<AppResponse<bool>> onSubmitEmail() async {
    setLoading = true;
    final result = await authRepository.forgetPassSendEmail(
      {'email':forgetHelper.email},);
    setLoading = false;
    return result;
  }
  Future<AppResponse<bool>> onSubmitCode() async {
    setLoading = true;
    final result = await authRepository.forgetPassSendCode(
        jsonEncode({   }),);
    setLoading = false;
    return result;
  }


}
