import 'package:flutter/material.dart';

class AccessDeniedPage extends StatelessWidget {
  const AccessDeniedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('You do not have permission to access this page.'),
      ),
    );
  }
}
