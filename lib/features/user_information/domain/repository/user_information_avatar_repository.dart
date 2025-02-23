abstract class UserInformationAvatarRepository {
  Future<String> getUserAvatar();

  Future<void> updateUserAvatar({required String path});
}
