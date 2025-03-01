import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/domain/entity/user_information_entity.dart';

@Singleton()
class UserInformationAvatarCacheDataSource {
  UserInformationEntity? userInformationEntity;
}
