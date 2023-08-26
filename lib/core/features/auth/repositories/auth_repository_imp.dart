import 'dart:convert';

import 'package:flutter_template/core/features/auth/models/onboarding_model.dart';
import 'package:flutter_template/core/features/auth/models/user_details.dart';
import 'package:flutter_template/core/features/auth/repositories/auth_repository.dart';
import 'package:flutter_template/core/response/response.dart';
import '../../../data/api/api_requests.dart';
import '../../../data/api/endpoints.dart';
import '../models/user_model.dart';
import '../../../response/api_response_handler.dart';

class AuthAppRepositoryImpl implements AuthAppRepository {
  final ApiController remoteDataSource;

  AuthAppRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AppResponse<UserModel>> onLogin(Map<String, dynamic> body) async {
    try {
      final uri = Uri.https(ENDPOINTS.baseURL, ENDPOINTS.login);
      final result = await remoteDataSource.post(uri, body);
      final resp =
          ApiResponseHandler(fromJson: UserModel.fromJson, response: result);
      return resp.handleResponse();
    } catch (e) {
      return AppResponse(status: ApiResStatus.error, message: e.toString());
    }
  }

  @override
  Future<AppResponse<UserDetails>> getUserDetails() async {
    try {
      final uri = Uri.https(ENDPOINTS.baseURL, ENDPOINTS.myProfile);

      final result = await remoteDataSource.get(uri);
      final resp =
          ApiResponseHandler(fromJson: (mapData) => UserDetails.fromJson(mapData['user']), response: result);
      return resp.handleResponse();
    } catch (e) {
      return AppResponse(status: ApiResStatus.error, message: e.toString());
    }
  }

  @override
  Future<AppResponse<UserModel>> onRegister(
      body, List<UploadFileHelper> fileHelper) async {
    try {
      final uri = Uri.https(ENDPOINTS.baseURL, ENDPOINTS.register);
      final result = await remoteDataSource.post(uri, body);
      final resp =
          ApiResponseHandler(fromJson: UserModel.fromJson, response: result);
      return resp.handleResponse();
    } catch (e) {
      return AppResponse(status: ApiResStatus.error, message: e.toString());
    }
  }

  @override
  Future<AppResponse<bool>> forgetPassSendEmail(
      Map<String, dynamic> body) async {
    try {
      final uri = Uri.https(ENDPOINTS.baseURL, ENDPOINTS.forgotPassSendEmail);

      final result = await remoteDataSource.post(uri, body);
      final resp =
          ApiResponseHandler(fromJson: (mapData) => true, response: result);
      return resp.handleResponse();
    } catch (e) {
      return AppResponse(status: ApiResStatus.error, message: e.toString());
    }
  }

  @override
  Future<AppResponse<bool>> forgetPassSendCode(body) async {
    try {
      final uri = Uri.https(ENDPOINTS.baseURL, ENDPOINTS.forgotPassSendCode);

      final result = await remoteDataSource.post(uri, body);
      final resp =
          ApiResponseHandler(fromJson: (mapData) => true, response: result);
      return resp.handleResponse();
    } catch (e) {
      return AppResponse(status: ApiResStatus.error, message: e.toString());
    }
  }

  @override
  Future<AppResponse<bool>> forgetPassChange(Map<String, dynamic> body) async {
    try {
      final uri = Uri.https(ENDPOINTS.baseURL, ENDPOINTS.forgotPassChange);
      final result =
          await remoteDataSource.post(ENDPOINTS.forgotPassChange, body);
      final resp = ApiResponseHandler(
          response: result,
          fromJson: (mapData) {
            return true;
          });
      return resp.handleResponse();
    } catch (e) {
      return AppResponse(status: ApiResStatus.error, message: e.toString());
    }
  }

  @override
  Future<AppResponse<List<OnboardingModel>>> getOnboarding() async{
    try {
      final uri = Uri.https(ENDPOINTS.baseURL, ENDPOINTS.onboarding);

      final result = await remoteDataSource.get(uri);
      final resp =
      ApiResponseHandler(fromJson: (mapData) => OnboardingModel.fromArray(mapData), response: result);
      return resp.handleResponse();
    } catch (e) {
      return AppResponse(status: ApiResStatus.error, message: e.toString());
    }
  }

  @override
  Future<AppResponse<UserModel>> onSocialLogin(Map<String, dynamic> body) async{
    try {
      final uri = Uri.https(ENDPOINTS.baseURL, ENDPOINTS.loginBySocial);
      final result = await remoteDataSource.post(uri, body);
      final resp =
      ApiResponseHandler(fromJson: UserModel.fromJson, response: result);
      return resp.handleResponse();
    } catch (e) {
      return AppResponse(status: ApiResStatus.error, message: e.toString());
    }
  }
}
