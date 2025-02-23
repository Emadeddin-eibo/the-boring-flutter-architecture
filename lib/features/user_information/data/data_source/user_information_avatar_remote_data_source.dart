import 'dart:math';

import 'package:injectable/injectable.dart';

@Injectable()
class UserInformationAvatarRemoteDataSource {
  UserInformationAvatarRemoteDataSource();

  Future<String> getUserAvatar() async {
    try {
      final imageResult = await _simulateGetImage();

      return imageResult;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> updateUserAvatar({required String pathToFile}) async {
    try {
      final uploadedImageUrl = await _simulateUpload(pathToFile);

      return uploadedImageUrl;
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Simulating uploading the image to Backend with 50/50 chance og failure.
  _simulateUpload(uploadedImageUrl) async {
    await Future.delayed(const Duration(milliseconds: 2500));

    if (Random().nextBool()) {
      throw Exception("Upload failed");
    } else {
      return "$uploadedImageUrl";
    }
  }

  /// Simulating getting the image from Backend.
  /// By default, let's assume that User does not have an avatar...
  /// If you want to test the case where User has already an image
  /// Just return `https://picsum.photos/200` instead of the empty String
  _simulateGetImage() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return '';
  }
}
