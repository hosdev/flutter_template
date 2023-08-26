import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/features/home/models/notification_model.dart';
import 'package:flutter_template/core/features/home/repositories/home_repository.dart';
import '../../../../data/api/api_requests.dart';
import '../../../../widgets/primary_future_builder.dart';

final notificationVMProvider = ChangeNotifierProvider.autoDispose<NotificationsState>((ref) {
  final cont = ref.read(apiControllerProvider);
  return NotificationsState(
      repository: HomeRepository(remoteDataSource: cont),
  );
});

class NotificationsState extends ChangeNotifier {
  final HomeRepository repository;
  NotificationsState({required this.repository}) {
    futureController.addFutureCall(repository.getNotifications);
  }

  final FutureBuilderController<List<NotificationModel>> futureController =
  FutureBuilderController();
}