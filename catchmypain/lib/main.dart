import 'package:catchmypain/view/login_page.dart';
import 'package:catchmypain/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const CatchMyPain());
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
]);

class CatchMyPain extends StatelessWidget {
  const CatchMyPain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
