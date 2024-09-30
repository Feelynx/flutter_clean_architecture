import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/shared/context_extension.dart';

class ErrorDialog {
  static void showErrorDialog({
    required BuildContext context,
    String? title,
    String? message,
    VoidCallback? onClose,
    VoidCallback? onRetry,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? context.l10n.genericErrorTitle),
          content: Text(message ?? context.l10n.genericErrorMessage),
          actions: <Widget>[
            if (onClose != null)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onClose();
                },
                child: const Text('Close'),
              ),
            if (onRetry != null)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onRetry();
                },
                child: const Text('Retry'),
              ),
          ],
        );
      },
    );
  }
}
