import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/domain/use_case/user_information_get_avatar_use_case.dart';
import 'package:my_app/features/user_information/domain/use_case/user_information_update_avatar_use_case.dart';

part 'user_information_avatar_event.dart';

part 'user_information_avatar_state.dart';

@Injectable()
class UserInformationAvatarBloc
    extends Bloc<UserInformationAvatarEvent, UserInformationAvatarState> {
  final UserInformationGetAvatarUseCase getAvatarUseCase;
  final UserInformationUpdateAvatarUseCase updateAvatarUseCase;

  UserInformationAvatarBloc(
    this.getAvatarUseCase,
    this.updateAvatarUseCase,
  ) : super(LoadingAvatarState()) {
    on<InitAvatarEvent>(_onInit);
    on<UpdateAvatarEvent>(_onUpdate);
  }

  Future<void> _onInit(
    InitAvatarEvent event,
    Emitter<UserInformationAvatarState> emit,
  ) async {
    try {
      final avatarUrl = await getAvatarUseCase();

      emit(IdleAvatarState(avatarUrl: avatarUrl));
    } catch (_) {
      emit(ErrorAvatarState());
    }
  }

  Future<void> _onUpdate(
    UpdateAvatarEvent event,
    Emitter<UserInformationAvatarState> emit,
  ) async {
    try {
      await updateAvatarUseCase(path: event.pathToUpload);
      emit(SuccessAvatarState());
    } catch (_) {
      emit(ErrorAvatarState());
    }
    add(InitAvatarEvent());
  }
}
