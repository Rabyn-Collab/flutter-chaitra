import 'package:flutter_chaitra/feature/auth/view/login.dart';
import 'package:flutter_chaitra/feature/auth/view/signup.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
          child: Login()
      ),
    ),
    GoRoute(
      path: '/signup',
      name: RouteEnum.signup.name,
      pageBuilder: (context, state) => NoTransitionPage(
          child:const  SignUp()
      ),
    )

  ]
);