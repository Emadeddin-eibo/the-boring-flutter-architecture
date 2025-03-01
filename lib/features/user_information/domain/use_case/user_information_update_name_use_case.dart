import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/domain/repository/user_information_avatar_repository.dart';

@Injectable()
class UserInformationUpdateNameUseCase {
  final UserInformationAvatarRepository repository;

  UserInformationUpdateNameUseCase({required this.repository});

  Future<void> call({required String name}) async {
    await repository.updateUserName(name: name);
  }
}
