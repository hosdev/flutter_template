import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/auth/models/user_details.dart';
import '../../../../data/api/api_requests.dart';
import '../../../../response/response.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/auth_repository_imp.dart';

final appInitProvider =
ChangeNotifierProvider.autoDispose<AppInitState>((ref) {
  final apiController = ref.read(apiControllerProvider);

  return AppInitState(
      authRepository: AuthAppRepositoryImpl(remoteDataSource: apiController),
      );
});

class AppInitState extends ChangeNotifier {
  final AuthAppRepository authRepository;
  AppInitState({required this.authRepository});
  bool loading = false;
  set setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<AppResponse<UserDetails>> getDetails() async {
    final result = await authRepository.getUserDetails();
    return result;
  }

}