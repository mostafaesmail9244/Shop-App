// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'favorites_model.g.dart';

@JsonSerializable()
class FavoritesModel {
  bool status;
  Data? data;
  FavoritesModel(
    this.status,
    this.data,
  );
  factory FavoritesModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'current_page')
  int currentPage;
  List<DataFavorites>? data;
  Data(
    this.currentPage,
    this.data,
  );
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class DataFavorites {
  int? id;
  ProductInfo product;
  DataFavorites(
    this.id,
    this.product,
  );
  factory DataFavorites.fromJson(Map<String, dynamic> json) =>
      _$DataFavoritesFromJson(json);
}

@JsonSerializable()
class ProductInfo {
  int id;
  dynamic price;
  @JsonKey(name: 'old_price')
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  String description;
  ProductInfo(
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  );
  factory ProductInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoFromJson(json);
}
