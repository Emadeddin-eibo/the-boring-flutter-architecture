import 'package:flutter/material.dart';
import 'package:my_app/features/user_information/domain/entity/user_information_entity.dart';
import 'package:my_app/features/user_information/presentation/widgets/age/user_information_age_widget.dart';
import 'package:my_app/features/user_information/presentation/widgets/avatar/avatar_circle_widget.dart';
import 'package:my_app/features/user_information/presentation/widgets/location/user_information_location_widget.dart';
import 'package:my_app/features/user_information/presentation/widgets/name/user_information_name_widget.dart';

class UserInformationDetailsWidget extends StatelessWidget {
  final UserInformationEntity userInformationEntity;
  final Function(String) onUpdateImage;
  final Function(String) onUpdateName;
  final Function(String) onUpdateLocation;
  final Function(String) onUpdateAge;

  const UserInformationDetailsWidget({
    required this.userInformationEntity,
    required this.onUpdateImage,
    required this.onUpdateName,
    required this.onUpdateLocation,
    required this.onUpdateAge,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          AvatarCircleWidget(
            avatarUrl: userInformationEntity.avatarUrl,
            onImageChange: onUpdateImage,
          ),
          const SizedBox(height: 12),
          UserInformationNameWidget(
            user: userInformationEntity,
            onUpdate: onUpdateName,
          ),
          const SizedBox(height: 12),
          UserInformationLocationWidget(
            user: userInformationEntity,
            onUpdate: onUpdateLocation,
          ),
          const SizedBox(height: 12),
          UserInformationAgeWidget(
            user: userInformationEntity,
            onUpdate: onUpdateAge,
          ),
        ],
      ),
    );
  }
}
