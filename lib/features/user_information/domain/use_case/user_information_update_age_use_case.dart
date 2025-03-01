import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/domain/repository/user_information_avatar_repository.dart';

@Injectable()
class UserInformationUpdateAgeUseCase {
  final UserInformationAvatarRepository repository;

  UserInformationUpdateAgeUseCase({required this.repository});

  Future<void> call({required String age}) async {
    await repository.updateUserAge(age: age);
  }
}
