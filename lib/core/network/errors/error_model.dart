
import 'package:tracking_app/core/network/remote/api_constants.dart';

class ErrorModel {
  final int? code;
  final String? message;

  const ErrorModel({
    this.code,
    this.message,
  });

  factory ErrorModel.fromMap(Map<String, dynamic> data) => ErrorModel(
        code: data[Errors.code] as int?,
        message: data[Errors.message] as String?,
      );
}
