import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/auth/models/user_model.dart';
import 'package:flutter_template/core/features/auth/repositories/auth_repository_imp.dart';
import 'package:flutter_template/core/widgets/primary_future_builder.dart';
import '../../../../data/api/api_requests.dart';
import '../../../../response/response.dart';
import '../../repositories/auth_repository.dart';
import '../../models/register_params.dart';

final registerStateProvider =
    ChangeNotifierProvider.autoDispose<RegisterViewModel>((ref) {
  final apiController = ref.read(apiControllerProvider);

  return RegisterViewModel(AuthAppRepositoryImpl(remoteDataSource: apiController));
});
class RegisterViewModel extends ChangeNotifier {
  final AuthAppRepository repository;

  RegisterViewModel(this.repository);
  RegisterParams registerParams = RegisterParams();

  Future<AppResponse<UserModel>> onRegister(String lang,String fcm) async {
    setLoading = true;
    final result =
    await repository.onRegister(await registerParams.toJsonBody(lang,fcm),[]);
    setLoading = false;
    return result;
  }

  bool loading = false;
  bool agreeTerms = false;
  bool hidePassword = true;
  int indexPage = 0;

  void hidePasswordSet() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  set setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  set setTerms(bool value) {
    agreeTerms = value;
    notifyListeners();
  }

  void onNextPage() {
    indexPage = ++indexPage;
    notifyListeners();
  }
  void toPage(int i) {
    indexPage = i;
    notifyListeners();
  }
  void onPreviousPage() {
    indexPage = --indexPage;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}




