// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/user_information/data/data_source/user_information_avatar_cache_data_source.dart'
    as _i866;
import '../../features/user_information/data/data_source/user_information_avatar_remote_data_source.dart'
    as _i152;
import '../../features/user_information/data/repository/user_information_avatar_repository_impl.dart'
    as _i577;
import '../../features/user_information/domain/repository/user_information_avatar_repository.dart'
    as _i403;
import '../../features/user_information/domain/use_case/user_information_get_avatar_use_case.dart'
    as _i100;
import '../../features/user_information/domain/use_case/user_information_update_avatar_use_case.dart'
    as _i123;
import '../../features/user_information/presentation/bloc/user_information_avatar_bloc.dart'
    as _i756;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i152.UserInformationAvatarRemoteDataSource>(
        () => _i152.UserInformationAvatarRemoteDataSource());
    gh.singleton<_i866.UserInformationAvatarCacheDataSource>(
        () => _i866.UserInformationAvatarCacheDataSource());
    gh.factory<_i403.UserInformationAvatarRepository>(() =>
        _i577.UserInformationAvatarRepositoryImpl(
          remoteDataSource: gh<_i152.UserInformationAvatarRemoteDataSource>(),
          cacheDataSource: gh<_i866.UserInformationAvatarCacheDataSource>(),
        ));
    gh.factory<_i100.UserInformationGetAvatarUseCase>(() =>
        _i100.UserInformationGetAvatarUseCase(
            repository: gh<_i403.UserInformationAvatarRepository>()));
    gh.factory<_i123.UserInformationUpdateAvatarUseCase>(() =>
        _i123.UserInformationUpdateAvatarUseCase(
            repository: gh<_i403.UserInformationAvatarRepository>()));
    gh.factory<_i756.UserInformationAvatarBloc>(
        () => _i756.UserInformationAvatarBloc(
              gh<_i100.UserInformationGetAvatarUseCase>(),
              gh<_i123.UserInformationUpdateAvatarUseCase>(),
            ));
    return this;
  }
}
