import 'package:flutter/material.dart';
import 'package:my_app/features/user_information/presentation/widgets/avatar/fake_image_picker.dart';

class AvatarCircleWidget extends StatelessWidget {
  final String avatarUrl;
  final Function(String) onImageChange;

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
            onPressed: () => _showGalleryPicker(context),
            child: Text(_getText()),
          ),
        ],
      ),
    );
  }

  void _showGalleryPicker(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return FakeImageUploader(
          onImageSelected: onImageChange,
        );
      },
    );
  }

  String _getText() {
    if (avatarUrl.isEmpty) {
      return 'Add new avatar';
    }
    return 'Change Avatar';
  }
}
