import 'package:catchmypain/view/camera_view/pose_detector_view.dart';
import 'package:catchmypain/view/page/drawing_page.dart';
import 'package:catchmypain/view/page/login_page.dart';
import 'package:catchmypain/view/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  initializeApp();
  runApp(const ProviderScope(
    child: CatchMyPain(),
  ));
}

Future<void> initializeApp() async {
  await Hive.initFlutter();
}

final GoRouter _router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/main',
    builder: (context, state) => MainPage(),
  ),
  GoRoute(
    path: '/camera/:exercise',
    builder: (context, state) {
      final exercise = state.pathParameters['exercise'];
      return PoseDetectorView(exercise: exercise ?? '');
    },
  ),
  GoRoute(
    path: '/drawing',
    builder: (context, state) => const DrawingPage(),
  ),
]);

class CatchMyPain extends StatelessWidget {
  const CatchMyPain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF4F4F4),
      ),
      routerConfig: _router,
    );
  }
}
