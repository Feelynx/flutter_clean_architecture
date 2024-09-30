import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/profile/cubit/profile_cubit.dart';
import 'package:flutter_clean_architecture/features/shared/error_dialog.dart';
import 'package:flutter_clean_architecture/features/shared/loading_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            ErrorDialog.showErrorDialog(context: context, title: 'Error', message: state.message);
          }
        },
        builder: (context, state) => switch (state) {
          ProfileInitial() || ProfileLoading() => const LoadingWidget(),
          ProfileLoaded() => Column(
              children: [
                Text(state.user.firstName ?? ''),
                Text(state.user.lastName ?? ''),
                Text(state.user.email ?? ''),
              ],
            ),
          _ => Container(),
        },
      ),
    );
  }
}
