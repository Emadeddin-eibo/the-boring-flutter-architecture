import 'package:equatable/equatable.dart';

class UserInformationExceptionResponse extends Equatable implements Exception {
  final String errorMsg;
  final String errorCode;

  const UserInformationExceptionResponse({
    required this.errorMsg,
    required this.errorCode,
  });

  factory UserInformationExceptionResponse.fromJson(Map<String, dynamic> json) {
    return UserInformationExceptionResponse(
      errorMsg: json['errorMsg'],
      errorCode: json['errorCode'],
    );
  }

  @override
  List<Object?> get props => [];
}
