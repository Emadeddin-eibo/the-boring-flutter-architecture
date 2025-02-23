part of 'user_information_avatar_bloc.dart';

sealed class UserInformationAvatarEvent {}

class InitAvatarEvent extends UserInformationAvatarEvent {}

class UpdateAvatarEvent extends UserInformationAvatarEvent {
  final String pathToUpload;

  UpdateAvatarEvent({required this.pathToUpload});
}
