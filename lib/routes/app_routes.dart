import 'package:flutter_chaitra/feature/auth/view/login.dart';
import 'package:flutter_chaitra/feature/auth/view/signup.dart';
import 'package:flutter_chaitra/feature/home/view/home_page.dart';
import 'package:flutter_chaitra/feature/shared/user_state_controller.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_routes.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  final userState = ref.watch(userStateControllerProvider);
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state){
      final authenticated = userState.token.isNotEmpty;
      final authenticating = (state.matchedLocation == '/login' || state.matchedLocation == '/signup');
      if(authenticated == false){
        return authenticating ? null : '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(child: const HomePage()),
      ),

      GoRoute(
        path: '/login',
        name: RouteEnum.login.name,
        pageBuilder:
            (context, state) => NoTransitionPage(child: const Login()),
      ),
      GoRoute(
        path: '/signup',
        name: RouteEnum.signup.name,
        pageBuilder:
            (context, state) => NoTransitionPage(child: const SignUp()),
      ),
    ],
  );
}
