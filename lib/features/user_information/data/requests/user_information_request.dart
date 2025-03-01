import 'package:equatable/equatable.dart';

class UserInformationRequest extends Equatable {
  final String fullName;
  final String location;
  final String avatarUrl;
  final String age;

  const UserInformationRequest({
    required this.fullName,
    required this.location,
    required this.avatarUrl,
    required this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "imageUrl": avatarUrl,
      "location": location,
      "age": age,
    };
  }

  @override
  List<Object?> get props => [fullName, location, avatarUrl, age];
}
