import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/data/responses/user_information_response.dart';
import 'package:my_app/features/user_information/domain/entity/user_information_entity.dart';

@Injectable()
class UserInformationMapper {
  UserInformationEntity map(UserInformationResponse response) {
    return UserInformationEntity(
      fullName: response.fullName,
      avatarUrl: response.avatarUrl,
      location: response.location,
      age: response.age,
    );
  }
}
