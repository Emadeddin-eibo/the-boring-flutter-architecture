import 'package:flutter/material.dart';
import 'package:my_app/features/user_information/domain/entity/user_information_entity.dart';
import 'package:my_app/features/user_information/presentation/widgets/shared/user_information_editing_dialog.dart';

class UserInformationAgeWidget extends StatelessWidget {
  final UserInformationEntity user;
  final Function(String) onUpdate;

  const UserInformationAgeWidget({
    super.key,
    required this.user,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.cake, color: Colors.orange, size: 18),
        const SizedBox(width: 6),
        Text(
          "${user.age} years old",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
          onPressed: () => showEditDialog(
            context,
            "Age",
            user.age.toString(),
            onUpdate,
          ),
        ),
      ],
    );
  }
}
