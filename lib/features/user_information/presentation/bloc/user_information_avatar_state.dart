part of 'user_information_avatar_bloc.dart';

sealed class UserInformationAvatarState extends Equatable {}

final class LoadingAvatarState extends UserInformationAvatarState {
  @override
  List<Object> get props => [];
}

final class IdleAvatarState extends UserInformationAvatarState {
  // Note: This should be entity, but since it's only one property, it's fine.
  final String avatarUrl;

  IdleAvatarState({required this.avatarUrl});

  @override
  List<Object> get props => [avatarUrl];
}

final class SuccessAvatarState extends UserInformationAvatarState {
  @override
  List<Object> get props => [];
}

final class ErrorAvatarState extends UserInformationAvatarState {
  // TODO(EMAD): Add Exception entity here.
  @override
  List<Object> get props => [];
}
