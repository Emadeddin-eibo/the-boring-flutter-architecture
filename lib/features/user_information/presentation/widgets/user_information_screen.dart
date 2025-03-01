import 'package:flutter/material.dart';
import 'package:my_app/features/user_information/presentation/widgets/user_information_widget.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
        backgroundColor: Colors.cyan,
      ),
      body: const Column(
        children: [
          SizedBox(height: 42),
          UserInformationWidget(),
        ],
      ),
    );
  }
}
