// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      json['status'] as bool?,
      json['data'] == null
          ? null
          : CategoriesDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

CategoriesDataModel _$CategoriesDataModelFromJson(Map<String, dynamic> json) =>
    CategoriesDataModel(
      json['currentPage'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => DataModelC.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['firstPageUrl'] as String?,
      json['from'] as int?,
      json['lastPage'] as int?,
      json['lastPageUrl'] as String?,
      json['path'] as String?,
      json['petPage'] as int?,
    );

Map<String, dynamic> _$CategoriesDataModelToJson(
        CategoriesDataModel instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'data': instance.data,
      'firstPageUrl': instance.firstPageUrl,
      'from': instance.from,
      'lastPage': instance.lastPage,
      'lastPageUrl': instance.lastPageUrl,
      'path': instance.path,
      'petPage': instance.petPage,
    };

DataModelC _$DataModelCFromJson(Map<String, dynamic> json) => DataModelC(
      json['id'] as int?,
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$DataModelCToJson(DataModelC instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
