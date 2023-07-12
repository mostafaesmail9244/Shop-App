// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : DataHomeModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

DataHomeModel _$DataHomeModelFromJson(Map<String, dynamic> json) =>
    DataHomeModel(
      (json['banners'] as List<dynamic>?)
          ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataHomeModelToJson(DataHomeModel instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'products': instance.products,
    };

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel(
      id: json['id'] as int?,
      image: json['image'],
    );

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as int?,
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      inFavorite: json['in_favorites'] as bool?,
      inCart: json['in_cart'] as bool?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'in_favorites': instance.inFavorite,
      'in_cart': instance.inCart,
    };
