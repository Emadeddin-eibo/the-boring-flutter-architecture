import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/data/data_source/user_information_avatar_cache_data_source.dart';
import 'package:my_app/features/user_information/data/data_source/user_information_avatar_remote_data_source.dart';
import 'package:my_app/features/user_information/domain/repository/user_information_avatar_repository.dart';

@Injectable(as: UserInformationAvatarRepository)
class UserInformationAvatarRepositoryImpl
    implements UserInformationAvatarRepository {
  final UserInformationAvatarRemoteDataSource remoteDataSource;
  final UserInformationAvatarCacheDataSource cacheDataSource;

  UserInformationAvatarRepositoryImpl({
    required this.remoteDataSource,
    required this.cacheDataSource,
  });

  @override
  Future<String> getUserAvatar() async {
    if (cacheDataSource.avatarUrl.isEmpty) {
      final avatarUrl = await remoteDataSource.getUserAvatar();

      cacheDataSource.avatarUrl = avatarUrl;
      return avatarUrl;
    } else {
      return cacheDataSource.avatarUrl;
    }
  }

  @override
  Future<void> updateUserAvatar({required String path}) async {
    final updatedAvatarUrl = await remoteDataSource.updateUserAvatar(pathToFile: path);

    cacheDataSource.avatarUrl = updatedAvatarUrl;
  }
}
