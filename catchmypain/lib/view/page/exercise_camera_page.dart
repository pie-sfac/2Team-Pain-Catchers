import 'package:flutter/material.dart';

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
              onPressed: () {
                print('Clicked');
              },
              child: const Text('It is ExerciseCameraPage'),
            ),
          ],
        ),
      ),
    );
  }
}
