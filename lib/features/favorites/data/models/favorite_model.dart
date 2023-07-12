import 'package:json_annotation/json_annotation.dart';
part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  bool status;
  String message;
  FavoriteModel({
    required this.status,
    required this.message,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
}

