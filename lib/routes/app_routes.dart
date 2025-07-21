import 'package:flutter_chaitra/feature/auth/view/login.dart';
import 'package:flutter_chaitra/feature/auth/view/signup.dart';
import 'package:flutter_chaitra/feature/home/view/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';


@riverpod
GoRouter goRoute (Ref ref) {
  return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Login(),
        ),
        // GoRoute(
        //   path: '/login',
        //   builder: (context, state) => const Login(),
        // ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => const Signup(),
        ),
      ]
  );
}
