import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/shared/context_extension.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/profile/cubit/profile_cubit.dart';
import 'package:flutter_clean_architecture/features/shared/error_dialog.dart';
import 'package:flutter_clean_architecture/features/shared/loading_widget.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          ErrorDialog.showErrorDialog(context: context, title: 'Error', message: state.message);
        }
      },
      builder: (context, state) => SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            context.read<ProfileCubit>().getUser();
            return Future.value();
          },
          child: switch (state) {
            ProfileInitial() || ProfileLoading() => const LoadingWidget(
                isTransparent: true,
              ),
            ProfileLoaded() => CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(state.user.image ?? ''),
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
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              context.l10n.contacts,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.user.email ?? ''),
                                Text(state.user.phone ?? ''),
                                Text(state.user.university ?? ''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            _ => Container(),
          },
        ),
      ),
    );
  }
}
