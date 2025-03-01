import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/domain/repository/user_information_avatar_repository.dart';

@Injectable()
class UserInformationUpdateLocationUseCase {
  final UserInformationAvatarRepository repository;

  UserInformationUpdateLocationUseCase({required this.repository});

  Future<void> call({required String location}) async {
    await repository.updateUserLocation(location: location);
  }
}
