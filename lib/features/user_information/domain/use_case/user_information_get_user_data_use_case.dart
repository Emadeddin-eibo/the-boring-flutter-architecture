import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/domain/entity/user_information_entity.dart';
import 'package:my_app/features/user_information/domain/repository/user_information_avatar_repository.dart';

@Injectable()
class UserInformationGetUserDataUseCase {
  final UserInformationAvatarRepository repository;

  UserInformationGetUserDataUseCase({required this.repository});

  Future<UserInformationEntity> call() async {
    return await repository.getUser();
  }
}
