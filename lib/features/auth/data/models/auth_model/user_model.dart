// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final bool status;
  final String message;
  final Data? data;
  const UserModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['status'] as bool,
      message: json['message'] ?? 'no Thing',
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  @override
  List<Object> get props => [
        status,
        message,
      ];
}

class Data extends Equatable {
  String? name;
  int? id;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  Data({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'email': email,
      'phone': phone,
      'image': image,
      'points': points,
      'credit': credit,
      'token': token,
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'],
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'] ?? 0,
      credit: json['credit'] ?? 0,
      token: json['token'],
    );
  }

  
  @override
  List<Object> get props {
    return [
      name!,
      id!,
      email!,
      phone!,
      image!,
      points!,
      credit!,
      token!,
    ];
  }
}
