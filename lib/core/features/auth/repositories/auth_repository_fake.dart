import 'package:flutter_template/core/features/auth/models/onboarding_model.dart';
import 'package:flutter_template/core/features/auth/models/user_details.dart';
import 'package:flutter_template/core/features/auth/repositories/auth_repository.dart';
import 'package:flutter_template/core/response/response.dart';
import '../../../data/api/api_requests.dart';
import '../models/user_model.dart';



class AuthAppRepositoryFake implements AuthAppRepository{


  @override
  Future<AppResponse<UserModel>> onLogin(body) async {
    throw UnimplementedError();
  }

  @override
  Future<AppResponse<UserModel>> onRegister(Map<String, String> body, List<UploadFileHelper> fileHelper) async {
    throw UnimplementedError();
  }

  @override
  Future<AppResponse<bool>> forgetPassChange(Map<String, dynamic> body) {
    throw UnimplementedError();
  }

  @override
  Future<AppResponse<bool>> forgetPassSendCode(body) {
    throw UnimplementedError();
  }

  @override
  Future<AppResponse<bool>> forgetPassSendEmail(Map<String, dynamic> body) {
    throw UnimplementedError();
  }

  @override
  Future<AppResponse<UserDetails>> getUserDetails() {
      throw UnimplementedError();
  }

  @override
  Future<AppResponse<List<OnboardingModel>>> getOnboarding() {
    // TODO: implement getOnboarding
    throw UnimplementedError();
  }

  @override
  Future<AppResponse<UserModel>> onSocialLogin(Map<String, dynamic> body) {
    // TODO: implement onSocialLogin
    throw UnimplementedError();
  }




}