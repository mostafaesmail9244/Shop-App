// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  bool status;
  Data? data;
  SearchModel(
    this.status,
    this.data,
  );
  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'current_page')
  int currentPage;
  List<Product>? data;
  Data(
    this.currentPage,
    this.data,
  );
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Product {
  int id;
  dynamic price;
  @JsonKey(name: 'old_price')
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  String description;
  Product(
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  );
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
