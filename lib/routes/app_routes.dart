import 'package:flutter_chaitra/pages/home_page.dart';
import 'package:flutter_chaitra/pages/search_page.dart';
import 'package:flutter_chaitra/pages/web_view_page.dart';
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

        ]
      ),
      GoRoute(
          path: '/webView',
         name: AppRoute.webView.name,
         pageBuilder: (context, state){
            return NoTransitionPage(child: WebViewPage(url: state.extra as String));
         }
      ),
      GoRoute(
          path: '/search',
          name: AppRoute.search.name,
          pageBuilder: (context, state){
            return NoTransitionPage(child: SearchPage(query: state.extra as String ,));
          }
      )

    ]
);