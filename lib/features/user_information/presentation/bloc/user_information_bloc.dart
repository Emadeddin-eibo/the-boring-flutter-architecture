import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/domain/entity/user_information_entity.dart';
import 'package:my_app/features/user_information/domain/exceptions/user_information_exceptions.dart';
import 'package:my_app/features/user_information/domain/use_case/user_information_get_user_data_use_case.dart';
import 'package:my_app/features/user_information/domain/use_case/user_information_update_age_use_case.dart';
import 'package:my_app/features/user_information/domain/use_case/user_information_update_avatar_use_case.dart';
import 'package:my_app/features/user_information/domain/use_case/user_information_update_location_use_case.dart';
import 'package:my_app/features/user_information/domain/use_case/user_information_update_name_use_case.dart';

part 'user_information_event.dart';

part 'user_information_state.dart';

@Injectable()
class UserInformationBloc
    extends Bloc<UserInformationEvent, UserInformationState> {
  final UserInformationGetUserDataUseCase getUserDataUseCase;
  final UserInformationUpdateAvatarUseCase updateAvatarUseCase;
  final UserInformationUpdateAgeUseCase updateAgeUseCase;
  final UserInformationUpdateNameUseCase updateNameUseCase;
  final UserInformationUpdateLocationUseCase updateLocationUseCase;

  UserInformationBloc(
    this.getUserDataUseCase,
    this.updateAvatarUseCase,
    this.updateAgeUseCase,
    this.updateNameUseCase,
    this.updateLocationUseCase,
  ) : super(LoadingState()) {
    on<InitEvent>(_onInit);
    on<UpdateAgeEvent>(_onUpdateAge);
    on<UpdateNameEvent>(_onUpdateName);
    on<UpdateAvatarEvent>(_onUpdateAvatar);
    on<UpdateLocationEvent>(_onUpdateLocation);
  }

  Future<void> _onInit(
    InitEvent event,
    Emitter<UserInformationState> emit,
  ) async {
    try {
      final userData = await getUserDataUseCase();

      emit(IdleState(user: userData));
    } on UserInformationExceptions catch (e) {
      emit(ErrorState(exception: e));
    }
  }

  Future<void> _onUpdateAge(
    UpdateAgeEvent event,
    Emitter<UserInformationState> emit,
  ) async {
    try {
      await updateAgeUseCase(age: event.updatedAge);

      emit(SuccessState());
    } on UserInformationExceptions catch (e) {
      emit(ErrorState(exception: e));
    }
    add(InitEvent());
  }

  Future<void> _onUpdateName(
    UpdateNameEvent event,
    Emitter<UserInformationState> emit,
  ) async {
    try {
      await updateNameUseCase(name: event.updatedName);

      emit(SuccessState());
    } on UserInformationExceptions catch (e) {
      emit(ErrorState(exception: e));
    }
    add(InitEvent());
  }

  Future<void> _onUpdateLocation(
    UpdateLocationEvent event,
    Emitter<UserInformationState> emit,
  ) async {
    try {
      await updateLocationUseCase(location: event.updatedLocation);

      emit(SuccessState());
    } on UserInformationExceptions catch (e) {
      emit(ErrorState(exception: e));
    }
    add(InitEvent());
  }

  Future<void> _onUpdateAvatar(
    UpdateAvatarEvent event,
    Emitter<UserInformationState> emit,
  ) async {
    try {
      await updateAvatarUseCase(path: event.pathToUpload);

      emit(SuccessState());
    } on UserInformationExceptions catch (e) {
      emit(ErrorState(exception: e));
    }
    add(InitEvent());
  }
}
