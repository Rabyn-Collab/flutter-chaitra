import 'package:flutter_chaitra/pages/home_page.dart';
import 'package:flutter_chaitra/pages/meal_page.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:go_router/go_router.dart';



final router = GoRouter(
    routes: [

      GoRoute(
          path: '/',
          builder: (context, state){
            return HomePage();
        },
        routes: [
          GoRoute(
              path: 'meal-page',
              name: AppRoute.meal.name,
              builder: (context, state){
                return MealPage(idMeal: state.extra as String);
              }
          )
        ]
      ),

    ]
);