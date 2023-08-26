import 'package:flutter_template/core/features/auth/models/onboarding_model.dart';
import 'package:flutter_template/core/features/auth/models/user_details.dart';
import 'package:flutter_template/core/response/response.dart';
import '../../../data/api/api_requests.dart';
import '../models/user_model.dart';

abstract class AuthAppRepository{
  Future<AppResponse<UserModel>> onLogin(Map<String,dynamic> body);
  Future<AppResponse<UserModel>> onRegister(Map<String, String> body, List<UploadFileHelper> fileHelper);
  Future<AppResponse<UserDetails>> getUserDetails();
  Future<AppResponse<List<OnboardingModel>>> getOnboarding();
  Future<AppResponse<bool>> forgetPassChange(Map<String,dynamic> body);
  Future<AppResponse<bool>> forgetPassSendCode(body);
  Future<AppResponse<bool>> forgetPassSendEmail(Map<String,dynamic> body);
  Future<AppResponse<UserModel>>  onSocialLogin(Map<String, dynamic> body);
}