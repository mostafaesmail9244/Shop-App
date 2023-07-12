// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  bool? status;
  CategoriesDataModel? data;

  CategoriesModel(this.status, this.data);

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}

@JsonSerializable()
class CategoriesDataModel {
  int? currentPage;
  List<DataModelC>? data = [];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? path;
  int? petPage;

  CategoriesDataModel(this.currentPage, this.data, this.firstPageUrl, this.from,
      this.lastPage, this.lastPageUrl, this.path, this.petPage);

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesDataModelToJson(this);
}

@JsonSerializable()
class DataModelC {
  int? id;
  String? name;
  String? image;

  DataModelC(this.id, this.name, this.image);
  factory DataModelC.fromJson(Map<String, dynamic> json) =>
      _$DataModelCFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelCToJson(this);
}
