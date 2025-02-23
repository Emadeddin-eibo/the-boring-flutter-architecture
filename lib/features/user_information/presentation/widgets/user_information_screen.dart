import 'package:flutter/material.dart';
import 'package:my_app/features/user_information/presentation/widgets/user_information_avatar.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Some other Widgets by other devs
        UserInformationAvatar(),
        // Some other Widgets by other devs
      ],
    );
  }
}
