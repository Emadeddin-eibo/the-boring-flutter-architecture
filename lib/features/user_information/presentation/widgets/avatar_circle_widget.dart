import 'package:flutter/material.dart';

class AvatarCircleWidget extends StatelessWidget {
  final String avatarUrl;
  final VoidCallback onImageChange;

  const AvatarCircleWidget({
    super.key,
    required this.avatarUrl,
    required this.onImageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.cyan,
            backgroundImage:
                avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
            child:
                avatarUrl.isEmpty ? const Icon(Icons.person, size: 60) : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onImageChange,
            child: Text(_getText()),
          ),
        ],
      ),
    );
  }

  String _getText() {
    if (avatarUrl.isEmpty) {
      return 'Add new avatar';
    }
    return 'Change Avatar';
  }
}
