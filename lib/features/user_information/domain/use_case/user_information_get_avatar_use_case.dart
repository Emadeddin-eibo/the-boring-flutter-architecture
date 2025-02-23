import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/domain/repository/user_information_avatar_repository.dart';

@Injectable()
class UserInformationGetAvatarUseCase {
  final UserInformationAvatarRepository repository;

  UserInformationGetAvatarUseCase({required this.repository});

  Future<String> call() async {
    return await repository.getUserAvatar();
  }
}
