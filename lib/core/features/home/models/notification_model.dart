import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory NotificationModel.fromJson(dynamic json) => _$NotificationModelFromJson(json);
  static List<NotificationModel> fromArray(List data) {
    return data.map((e) => NotificationModel.fromJson(e)).toList();
  }

  int id;
  String title;
  String description;
}
