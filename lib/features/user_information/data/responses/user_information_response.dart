import 'package:equatable/equatable.dart';

class UserInformationResponse extends Equatable {
  final String fullName;
  final String location;
  final String avatarUrl;
  final String age;

  const UserInformationResponse({
    required this.fullName,
    required this.location,
    required this.avatarUrl,
    required this.age,
  });

  factory UserInformationResponse.fromJson(Map<String, dynamic> data) {
    return UserInformationResponse(
      fullName: data['fullName'],
      location: data['location'],
      avatarUrl: data['imageUrl'],
      age: data['age'],
    );
  }

  @override
  List<Object?> get props => [fullName, location, avatarUrl, age];
}
