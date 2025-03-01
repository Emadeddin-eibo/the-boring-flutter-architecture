import 'package:flutter/material.dart';
import 'package:my_app/features/user_information/domain/exceptions/user_information_exceptions.dart';

void showLoadingToast(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Saving...'),
      duration: Duration(milliseconds: 1500),
    ),
  );
}

void showSuccessToast(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Profile updated successfully!'),
      duration: Duration(milliseconds: 1500),
      backgroundColor: Colors.green,
    ),
  );
}

void showErrorToast(context, UserInformationExceptions exception) {
  var errorMessage = '';

  switch (exception) {
    case AvatarUploadFailureException():
      errorMessage = 'Could not update avatar';
      break;
    case NameChangeFailureException():
      errorMessage = 'Could not update your name';
      break;
    case AgeChangeFailureException():
      errorMessage = 'Could not update your age';
      break;
    case LocationChangeFailureException():
      errorMessage = 'Could not update your location';
      break;
    case UserInformationUnknownException():
      errorMessage = 'Something went wrong, could not update information.';
      break;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      duration: const Duration(milliseconds: 1500),
      backgroundColor: Colors.red,
    ),
  );
}
