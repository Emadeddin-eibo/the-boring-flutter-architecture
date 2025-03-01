import 'package:equatable/equatable.dart';

class UserInformationEntity extends Equatable {
  final String fullName;
  final String avatarUrl;
  final String location;
  final String age;

  const UserInformationEntity({
    required this.fullName,
    required this.avatarUrl,
    required this.location,
    required this.age,
  });

  UserInformationEntity copyWith({
    String? fullName,
    String? avatarUrl,
    String? location,
    String? age,
  }) {
    return UserInformationEntity(
      fullName: fullName ?? this.fullName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      location: location ?? this.location,
      age: age ?? this.age,
    );
  }

  @override
  List<Object?> get props => [fullName, avatarUrl, location, age];
}
