import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/notifications.dart';
import '../../../../../data/api/api_requests.dart';
import '../../../../../response/response.dart';
import '../../../models/user_model.dart';
import '../../../repositories/auth_repository.dart';
import '../../../repositories/auth_repository_imp.dart';




final socialLoginProvider = ChangeNotifierProvider<SocialLoginViewModel>((ref) {
  final apiController = ref.read(apiControllerProvider);

  return SocialLoginViewModel(AuthAppRepositoryImpl(remoteDataSource: apiController));
});

class SocialLoginViewModel extends ChangeNotifier {
  final AuthAppRepository repository;

  SocialLoginViewModel(this.repository);

  bool loading=false;



  Future<AppResponse<UserModel>> onSocialLogin(String token,String provider)async{
    setLoading=true;
    final result=  await repository.onSocialLogin({'provider':provider,'token':token,'fcm':await FCM.getToken()}) ;
    setLoading=false;
    return result;
  }

  set setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

}

