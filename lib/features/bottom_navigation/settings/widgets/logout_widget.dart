import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/core/shared/context_extension.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(context.l10n.logout),
      subtitle: Text(context.l10n.logoutMessage),
      trailing: const Icon(Icons.logout),
      onTap: () => authNotifier.doLogout(),
    );
  }
}
