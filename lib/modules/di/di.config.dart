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
import '../../features/user_information/data/mappers/user_information_mapper.dart'
    as _i15;
import '../../features/user_information/data/repository/user_information_avatar_repository_impl.dart'
    as _i577;
import '../../features/user_information/domain/repository/user_information_avatar_repository.dart'
    as _i403;
import '../../features/user_information/domain/use_case/user_information_get_user_data_use_case.dart'
    as _i794;
import '../../features/user_information/domain/use_case/user_information_update_age_use_case.dart'
    as _i759;
import '../../features/user_information/domain/use_case/user_information_update_avatar_use_case.dart'
    as _i123;
import '../../features/user_information/domain/use_case/user_information_update_location_use_case.dart'
    as _i552;
import '../../features/user_information/domain/use_case/user_information_update_name_use_case.dart'
    as _i863;
import '../../features/user_information/presentation/bloc/user_information_bloc.dart'
    as _i821;

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
    gh.factory<_i15.UserInformationMapper>(() => _i15.UserInformationMapper());
    gh.singleton<_i866.UserInformationAvatarCacheDataSource>(
        () => _i866.UserInformationAvatarCacheDataSource());
    gh.factory<_i403.UserInformationAvatarRepository>(() =>
        _i577.UserInformationAvatarRepositoryImpl(
          remoteDataSource: gh<_i152.UserInformationAvatarRemoteDataSource>(),
          cacheDataSource: gh<_i866.UserInformationAvatarCacheDataSource>(),
          userInformationMapper: gh<_i15.UserInformationMapper>(),
        ));
    gh.factory<_i794.UserInformationGetUserDataUseCase>(() =>
        _i794.UserInformationGetUserDataUseCase(
            repository: gh<_i403.UserInformationAvatarRepository>()));
    gh.factory<_i759.UserInformationUpdateAgeUseCase>(() =>
        _i759.UserInformationUpdateAgeUseCase(
            repository: gh<_i403.UserInformationAvatarRepository>()));
    gh.factory<_i123.UserInformationUpdateAvatarUseCase>(() =>
        _i123.UserInformationUpdateAvatarUseCase(
            repository: gh<_i403.UserInformationAvatarRepository>()));
    gh.factory<_i552.UserInformationUpdateLocationUseCase>(() =>
        _i552.UserInformationUpdateLocationUseCase(
            repository: gh<_i403.UserInformationAvatarRepository>()));
    gh.factory<_i863.UserInformationUpdateNameUseCase>(() =>
        _i863.UserInformationUpdateNameUseCase(
            repository: gh<_i403.UserInformationAvatarRepository>()));
    gh.factory<_i821.UserInformationBloc>(() => _i821.UserInformationBloc(
          gh<_i794.UserInformationGetUserDataUseCase>(),
          gh<_i123.UserInformationUpdateAvatarUseCase>(),
          gh<_i759.UserInformationUpdateAgeUseCase>(),
          gh<_i863.UserInformationUpdateNameUseCase>(),
          gh<_i552.UserInformationUpdateLocationUseCase>(),
        ));
    return this;
  }
}
