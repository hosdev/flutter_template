import 'package:flutter_template/core/features/home/models/banner_model.dart';
import 'package:flutter_template/core/features/home/models/notification_model.dart';
import 'package:flutter_template/core/response/response.dart';
import '../../../data/api/api_requests.dart';
import '../../../data/api/endpoints.dart';
import '../../../response/api_response_handler.dart';

class HomeRepository {
  final ApiController remoteDataSource;

  HomeRepository({required this.remoteDataSource});

  Future<AppResponse<List<NotificationModel>>> getNotifications() async {
    try {
      final uri = Uri.https(ENDPOINTS.baseURL, ENDPOINTS.notification);
      final result = await remoteDataSource.get(
        uri,
      );
      final resp = ApiResponseHandler(
          fromJson: (mapData) => NotificationModel.fromArray(mapData),
          response: result);
      return resp.handleResponse();
    } catch (e) {
      return AppResponse(status: ApiResStatus.error, message: e.toString());
    }
  }

  Future<AppResponse<List<BannerModel>>> getBanners() async {
    try {
      final uri = Uri.https(ENDPOINTS.baseURL, ENDPOINTS.homeBanners);
      final result = await remoteDataSource.get(
        uri,
      );
      final resp = ApiResponseHandler(
          fromJson: (mapData) => BannerModel.fromArray(mapData),
          response: result);
      return resp.handleResponse();
    } catch (e) {
      return AppResponse(status: ApiResStatus.error, message: e.toString());
    }
  }



}
