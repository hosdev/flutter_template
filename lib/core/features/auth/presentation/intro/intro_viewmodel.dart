import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/auth/models/user_model.dart';
import 'package:flutter_template/core/features/auth/repositories/auth_repository_imp.dart';
import 'package:flutter_template/core/response/response.dart';
import '../../../../data/api/api_requests.dart';
import '../../repositories/auth_repository.dart';

final introStateProvider = ChangeNotifierProvider<IntroViewModel>((ref) {
  final apiController = ref.read(apiControllerProvider);

  return IntroViewModel(AuthAppRepositoryImpl(remoteDataSource: apiController));
});

class IntroViewModel extends ChangeNotifier {
  final AuthAppRepository repository;

  IntroViewModel(this.repository);

  bool loading = false;
  bool hidePassword = true;

  Future<AppResponse<UserModel>> onSocialLogin(
      String token, String provider) async {
    setLoading = true;
    final result =
        await repository.onSocialLogin({'provider': provider, 'token': token});
    setLoading = false;
    return result;
  }

  set setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
