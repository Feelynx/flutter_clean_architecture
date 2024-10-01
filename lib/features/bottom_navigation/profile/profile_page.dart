import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/profile/cubit/profile_cubit.dart';
import 'package:flutter_clean_architecture/features/shared/error_dialog.dart';
import 'package:flutter_clean_architecture/features/shared/loading_widget.dart';
import 'package:gap/gap.dart';

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
          ProfileLoaded() => SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(state.user.image ?? ''),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Text(
                    '${state.user.firstName} ${state.user.lastName}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    '${state.user.company?.title}\n@${state.user.company?.name}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Gap(24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          'Contacts',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${state.user.email}'),
                            Text('${state.user.phone}'),
                            Text('${state.user.university}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          _ => Container(),
        },
      ),
    );
  }
}
