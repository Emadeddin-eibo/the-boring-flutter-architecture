import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/data/data_source/user_information_avatar_cache_data_source.dart';
import 'package:my_app/features/user_information/data/data_source/user_information_avatar_remote_data_source.dart';
import 'package:my_app/features/user_information/data/mappers/user_information_mapper.dart';
import 'package:my_app/features/user_information/data/requests/user_information_request.dart';
import 'package:my_app/features/user_information/data/responses/user_information_response.dart';
import 'package:my_app/features/user_information/domain/entity/user_information_entity.dart';
import 'package:my_app/features/user_information/domain/exceptions/user_information_exceptions.dart';
import 'package:my_app/features/user_information/domain/repository/user_information_avatar_repository.dart';

@Injectable(as: UserInformationAvatarRepository)
class UserInformationAvatarRepositoryImpl
    implements UserInformationAvatarRepository {
  final UserInformationAvatarRemoteDataSource remoteDataSource;
  final UserInformationAvatarCacheDataSource cacheDataSource;
  final UserInformationMapper userInformationMapper;

  UserInformationAvatarRepositoryImpl({
    required this.remoteDataSource,
    required this.cacheDataSource,
    required this.userInformationMapper,
  });

  @override
  Future<UserInformationEntity> getUser() async {
    if (cacheDataSource.userInformationEntity == null) {
      final userData = await remoteDataSource.getUserInformation();
      final mappedUserData = userInformationMapper.map(userData);

      _updateCache(userData);
      return mappedUserData;
    } else {
      return cacheDataSource.userInformationEntity!;
    }
  }

  @override
  Future<void> updateUserAvatar({required String path}) async {
    try {
      final cachedUser = cacheDataSource.userInformationEntity;

      final requestObject = UserInformationRequest(
        avatarUrl: path,
        age: cachedUser?.age ?? '',
        fullName: cachedUser?.fullName ?? '',
        location: cachedUser?.location ?? '',
      );

      final updatedCache = await remoteDataSource.updateUserInformation(
        request: requestObject,
      );

      _updateCache(updatedCache);
    } catch (_) {
      throw AvatarUploadFailureException();
    }
  }

  @override
  Future<void> updateUserAge({required String age}) async {
    try {
      final cachedUser = cacheDataSource.userInformationEntity;

      final requestObject = UserInformationRequest(
        age: age,
        fullName: cachedUser?.fullName ?? '',
        location: cachedUser?.location ?? '',
        avatarUrl: cachedUser?.avatarUrl ?? '',
      );

      final updatedCache = await remoteDataSource.updateUserInformation(
        request: requestObject,
      );

      _updateCache(updatedCache);
    } catch (_) {
      throw AgeChangeFailureException();
    }
  }

  @override
  Future<void> updateUserLocation({required String location}) async {
    try {
      final cachedUser = cacheDataSource.userInformationEntity;

      final requestObject = UserInformationRequest(
        location: location,
        age: cachedUser?.age ?? '',
        fullName: cachedUser?.fullName ?? '',
        avatarUrl: cachedUser?.avatarUrl ?? '',
      );

      final updatedCache = await remoteDataSource.updateUserInformation(
        request: requestObject,
      );

      _updateCache(updatedCache);
    } catch (_) {
      throw LocationChangeFailureException();
    }
  }

  @override
  Future<void> updateUserName({required String name}) async {
    try {
      final cachedUser = cacheDataSource.userInformationEntity;

      final requestObject = UserInformationRequest(
        fullName: name,
        age: cachedUser?.age ?? '',
        location: cachedUser?.location ?? '',
        avatarUrl: cachedUser?.avatarUrl ?? '',
      );

      final updatedCache = await remoteDataSource.updateUserInformation(
        request: requestObject,
      );

      _updateCache(updatedCache);
    } catch (_) {
      throw NameChangeFailureException();
    }
  }

  void _updateCache(UserInformationResponse response) {
    final mappedUserData = userInformationMapper.map(response);
    cacheDataSource.userInformationEntity = mappedUserData;
  }
}
