import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExerciseCameraPage extends StatelessWidget {
  const ExerciseCameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/camera'),
              child: const Text('It is ExerciseCameraPage'),
            ),
          ],
        ),
      ),
    );
  }
}
