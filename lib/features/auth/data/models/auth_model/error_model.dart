// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final bool status;
  final String message;
  const ErrorModel({
    required this.status,
    required this.message,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        status: json['status'],
        message: json['message'],
      );

  @override
  List<Object> get props => [status, message];
}
