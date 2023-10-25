import 'package:flutter/material.dart';

class CenterManagementPage extends StatelessWidget {
  const CenterManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('It is CenterManagementPage')]),
      ),
    );
  }
}
