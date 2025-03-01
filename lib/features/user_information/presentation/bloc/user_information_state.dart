part of 'user_information_bloc.dart';

sealed class UserInformationState extends Equatable {}

final class LoadingState extends UserInformationState {
  @override
  List<Object> get props => [];
}

final class IdleState extends UserInformationState {
  final UserInformationEntity user;

  IdleState({required this.user});

  @override
  List<Object> get props => [user];
}

final class SuccessState extends UserInformationState {
  @override
  List<Object> get props => [];
}

final class ErrorState extends UserInformationState {
  final UserInformationExceptions exception;

  ErrorState({required this.exception});

  @override
  List<Object> get props => [exception];
}
