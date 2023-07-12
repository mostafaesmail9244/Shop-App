// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesModel _$FavoritesModelFromJson(Map<String, dynamic> json) =>
    FavoritesModel(
      json['status'] as bool,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritesModelToJson(FavoritesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['current_page'] as int,
      (json['data'] as List<dynamic>?)
          ?.map((e) => DataFavorites.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
    };

DataFavorites _$DataFavoritesFromJson(Map<String, dynamic> json) =>
    DataFavorites(
      json['id'] as int?,
      ProductInfo.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataFavoritesToJson(DataFavorites instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

ProductInfo _$ProductInfoFromJson(Map<String, dynamic> json) => ProductInfo(
      json['id'] as int,
      json['price'],
      json['old_price'],
      json['discount'],
      json['image'] as String,
      json['name'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$ProductInfoToJson(ProductInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
    };
