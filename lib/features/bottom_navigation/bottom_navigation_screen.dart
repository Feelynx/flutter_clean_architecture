import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/shared/context_extension.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        child: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_filled),
              label: context.l10n.home,
            ),
            NavigationDestination(
              icon: const Icon(Icons.person),
              label: context.l10n.profile,
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings),
              label: context.l10n.settings,
            ),
          ],
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
        ),
      ),
    );
  }
}
