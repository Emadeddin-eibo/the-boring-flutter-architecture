import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/domain/repository/user_information_avatar_repository.dart';

@Injectable()
class UserInformationUpdateAvatarUseCase {
  final UserInformationAvatarRepository repository;

  UserInformationUpdateAvatarUseCase({required this.repository});

  Future<void> call({required String path}) async {
    await repository.updateUserAvatar(path: path);
  }
}
