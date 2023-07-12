// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  bool? status;
  DataHomeModel? data;
  HomeModel({
    this.status,
    this.data,
  });
  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

  // HomeModel.fromJson(Map<String, dynamic> json) {
  //   status = json['status'];
  //   data = DataHomeModel.fromJson(json['data']);
  // }
}

@JsonSerializable()
class DataHomeModel {
  List<BannerModel>? banners ;
  List<ProductModel>? products ;
  DataHomeModel(
    this.banners,
    this.products,
  );
  factory DataHomeModel.fromJson(Map<String, dynamic> json) =>
      _$DataHomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataHomeModelToJson(this);

  // DataHomeModel.fromJson(Map<String, dynamic> json) {
  //   json['banners'].forEach((element) {
  //     banners.add(BannerModel.fromJson(element));
  //   });
  //   json['products'].forEach((element) {
  //     products.add(ProductModel.fromJson(element));
  //   });
  // }
}

@JsonSerializable()
class BannerModel {
  int? id;
  dynamic image;
  BannerModel({
    this.id,
    this.image,
  });
  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerModelToJson(this);

  // BannerModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   image = json['image'];
  // }
}

@JsonSerializable()
class ProductModel {
  int? id;
  dynamic price;
  @JsonKey(name: 'old_price')
  dynamic oldPrice;
  dynamic discount;
  dynamic image;
  dynamic name;
  dynamic description;
  @JsonKey(name: 'in_favorites')
  bool? inFavorite;
  @JsonKey(name: 'in_cart')
  bool? inCart;
  ProductModel({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.inFavorite,
    this.inCart,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  // ProductModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   price = json['price'];
  //   oldPrice = json['old_price'];
  //   discount = json['discount'];
  //   image = json['image'];
  //   name = json['name'];
  //   inFavorite = json['in_favorites'];
  //   inCart = json['in_cart'];
  //   description = json['description'];
  // }
}
