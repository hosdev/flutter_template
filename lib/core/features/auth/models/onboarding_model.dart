import 'package:json_annotation/json_annotation.dart';
part 'onboarding_model.g.dart';

@JsonSerializable()
class OnboardingModel {
  OnboardingModel({
    required this.title,
    required this.image,});

  factory OnboardingModel.fromJson(dynamic json) =>
      _$OnboardingModelFromJson(json);
  String title;
  String image;

  static List<OnboardingModel> fromArray(List data) {
    return data.map((e) => OnboardingModel.fromJson(e)).toList();
  }

}