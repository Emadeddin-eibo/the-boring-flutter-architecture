import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/user_information/presentation/bloc/user_information_avatar_bloc.dart';
import 'package:my_app/features/user_information/presentation/widgets/avatar_circle_widget.dart';
import 'package:my_app/features/user_information/presentation/widgets/fake_image_picker.dart';
import 'package:my_app/modules/di/di.dart';

class UserInformationAvatar extends StatefulWidget {
  const UserInformationAvatar({super.key});

  @override
  State<UserInformationAvatar> createState() => _UserInformationAvatarState();
}

class _UserInformationAvatarState extends State<UserInformationAvatar> {
  final UserInformationAvatarBloc _bloc = locator();

  @override
  void initState() {
    _bloc.add(InitAvatarEvent());
    super.initState();
  }

  _onImageSelected(String url) {
    _showLoadingToast();
    _bloc.add(UpdateAvatarEvent(pathToUpload: url));
  }

  void _showLoadingToast() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Uploading new image...'),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }

  void _showSuccessToast() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile image updated successfully!'),
        duration: Duration(milliseconds: 1500),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorToast() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Something went wrong, could not upload new image...'),
        duration: Duration(milliseconds: 1500),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _bloc,
      builder: _builder,
      listener: _listener,
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
    );
  }

  bool _listenWhen(previous, current) {
    return current is SuccessAvatarState || current is ErrorAvatarState;
  }

  void _listener(BuildContext context, state) {
    if (state is SuccessAvatarState) {
      _showSuccessToast();
    }

    if (state is ErrorAvatarState) {
      _showErrorToast();
    }
  }

  bool _buildWhen(previous, current) {
    return current is IdleAvatarState;
  }

  Widget _builder(BuildContext context, state) {
    if (state is IdleAvatarState) {
      return AvatarCircleWidget(
        avatarUrl: state.avatarUrl,
        onImageChange: _showGalleryPicker,
      );
    }
    return const Center(child: CircularProgressIndicator());
  }

  void _showGalleryPicker() {
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
          onImageSelected: _onImageSelected,
        );
      },
    );
  }
}
