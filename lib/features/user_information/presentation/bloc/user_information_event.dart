part of 'user_information_bloc.dart';

sealed class UserInformationEvent {}

class InitEvent extends UserInformationEvent {}

class UpdateAvatarEvent extends UserInformationEvent {
  final String pathToUpload;

  UpdateAvatarEvent({required this.pathToUpload});
}

class UpdateAgeEvent extends UserInformationEvent {
  final String updatedAge;

  UpdateAgeEvent({required this.updatedAge});
}

class UpdateNameEvent extends UserInformationEvent {
  final String updatedName;

  UpdateNameEvent({required this.updatedName});
}

class UpdateLocationEvent extends UserInformationEvent {
  final String updatedLocation;

  UpdateLocationEvent({required this.updatedLocation});
}
