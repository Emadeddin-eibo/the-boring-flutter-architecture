import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/user_information/presentation/bloc/user_information_bloc.dart';
import 'package:my_app/features/user_information/presentation/widgets/shared/user_information_toast.dart';
import 'package:my_app/features/user_information/presentation/widgets/user_information_details_widget.dart';
import 'package:my_app/modules/di/di.dart';

class UserInformationWidget extends StatefulWidget {
  const UserInformationWidget({super.key});

  @override
  State<UserInformationWidget> createState() => _UserInformationWidgetState();
}

class _UserInformationWidgetState extends State<UserInformationWidget> {
  final UserInformationBloc _bloc = locator();

  @override
  void initState() {
    _bloc.add(InitEvent());
    super.initState();
  }

  _onImageChanged(String url) {
    showLoadingToast(context);
    _bloc.add(UpdateAvatarEvent(pathToUpload: url));
  }

  _onAgeChanged(String age) {
    showLoadingToast(context);
    _bloc.add(UpdateAgeEvent(updatedAge: age));
  }

  _onNameChanged(String name) {
    showLoadingToast(context);
    _bloc.add(UpdateNameEvent(updatedName: name));
  }

  _onLocationChanged(String location) {
    showLoadingToast(context);
    _bloc.add(UpdateLocationEvent(updatedLocation: location));
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

  Widget _builder(BuildContext context, state) {
    if (state is IdleState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserInformationDetailsWidget(
            userInformationEntity: state.user,
            onUpdateAge: _onAgeChanged,
            onUpdateName: _onNameChanged,
            onUpdateImage: _onImageChanged,
            onUpdateLocation: _onLocationChanged,
          ),
        ],
      );
    }
    return const Center(child: CircularProgressIndicator());
  }

  bool _listenWhen(previous, current) {
    return current is SuccessState || current is ErrorState;
  }

  void _listener(BuildContext context, state) {
    if (state is SuccessState) {
      showSuccessToast(context);
    }

    if (state is ErrorState) {
      showErrorToast(context, state.exception);
    }
  }

  bool _buildWhen(previous, current) {
    return current is IdleState;
  }
}
