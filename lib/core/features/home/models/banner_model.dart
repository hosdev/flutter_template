import 'package:json_annotation/json_annotation.dart';
part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  final String image;
  final String? link;
  final int id;

  BannerModel( {required this.image,this.link, required this.id,});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
  static List<BannerModel> fromArray(List data) {
    return data.map((e) => BannerModel.fromJson(e)).toList();
  }
}



