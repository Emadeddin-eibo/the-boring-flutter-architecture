import 'package:flutter/material.dart';
import 'package:my_app/features/user_information/domain/entity/user_information_entity.dart';
import 'package:my_app/features/user_information/presentation/widgets/shared/user_information_editing_dialog.dart';

class UserInformationNameWidget extends StatelessWidget {
  final UserInformationEntity user;
  final Function(String) onUpdate;

  const UserInformationNameWidget({
    super.key,
    required this.user,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          user.fullName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
          onPressed: () => showEditDialog(
            context,
            "Name",
            user.fullName,
            onUpdate,
          ),
        ),
      ],
    );
  }
}
