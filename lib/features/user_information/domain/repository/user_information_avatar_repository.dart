import 'package:my_app/features/user_information/domain/entity/user_information_entity.dart';

abstract class UserInformationAvatarRepository {
  Future<UserInformationEntity> getUser();

  Future<void> updateUserAvatar({required String path});

  Future<void> updateUserName({required String name});

  Future<void> updateUserAge({required String age});

  Future<void> updateUserLocation({required String location});
}
