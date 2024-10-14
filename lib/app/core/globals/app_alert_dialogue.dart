import 'package:flutter/material.dart';

/// Displays an alert dialog with a [title] and [message].
///
/// The dialog is built within the [context] it's provided, and includes a single
/// 'Ok' button that, when pressed, closes the dialog.
///
/// The [title] parameter represents the title of the alert dialog.
/// The [message] parameter represents the content of the alert dialog.
Future<T?> appAlertDialog<T>(BuildContext context, String title, String message, {VoidCallback? onPressed, VoidCallback? onAccepted}) async {
  // showDialog is a built-in Flutter method that displays a Material Design dialog.
  return showDialog<T>(
    barrierDismissible: false,
    context: context, // The context in which the dialog should be shown.
    builder: (context) => AlertDialog(
      // The actual dialog.
      title: Text(title), // The title of the dialog.
      content: Text(message), // The content of the dialog.
      // The actions for the dialog. In this case, a single 'Ok' button that closes the dialog.
      actions: [
        TextButton(
          onPressed: () {
            if (onPressed != null) {
              onPressed();
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(onAccepted != null ? "Cancel" : "Ok"),
        ),
        if (onAccepted != null)
          TextButton(
            onPressed: () {
              onAccepted();
            },
            child: const Text("Ok"),
          ),
      ],
    ),
  );
}
