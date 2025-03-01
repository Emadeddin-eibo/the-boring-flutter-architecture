import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:my_app/features/user_information/data/requests/user_information_request.dart';
import 'package:my_app/features/user_information/data/responses/user_information_exception_response.dart';
import 'package:my_app/features/user_information/data/responses/user_information_response.dart';
import 'package:my_app/features/user_information/domain/exceptions/user_information_exceptions.dart';

@Injectable()
class UserInformationAvatarRemoteDataSource {
  UserInformationAvatarRemoteDataSource();

  Future<UserInformationResponse> getUserInformation() async {
    try {
      final apiResponse = await _simulateUserFromApi();

      if (apiResponse['success']) {
        return UserInformationResponse.fromJson(apiResponse['data']);
      } else {
        throw UserInformationExceptionResponse.fromJson(apiResponse);
      }
    } catch (_) {
      throw UserInformationUnknownException();
    }
  }

  Future<UserInformationResponse> updateUserInformation({
    required UserInformationRequest request,
  }) async {
    try {
      final apiResponse = await _simulateUploadData(request);

      if (apiResponse['success']) {
        return UserInformationResponse.fromJson(apiResponse['data']);
      } else {
        throw UserInformationExceptionResponse.fromJson(apiResponse);
      }
    } catch (e) {
      throw UserInformationUnknownException();
    }
  }

  _simulateUploadData(UserInformationRequest userData) async {
    await Future.delayed(const Duration(milliseconds: 2500));

    return {
      "success": true,
      "message": "User retrieved successfully",
      "data": userData.toJson(),
    };
  }

  _simulateUserFromApi() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    return {
      "success": true,
      "message": "User retrieved successfully",
      "data": {
        "fullName": "John Doe",
        "imageUrl": "https://picsum.photos/200",
        "location": "Dubai, United Arab Emirates",
        "age": "35"
      }
    };
  }
}
