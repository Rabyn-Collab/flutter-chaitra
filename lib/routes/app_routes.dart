import 'package:flutter_chaitra/models/book.dart';
import 'package:flutter_chaitra/pages/detail_page.dart';
import 'package:flutter_chaitra/pages/grid_page.dart';
import 'package:flutter_chaitra/pages/home_page.dart';
import 'package:flutter_chaitra/pages/simple_detail_page.dart';
import 'package:flutter_chaitra/pages/simple_page.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(
    routes: [

      GoRoute(
          path: '/',
        builder: (context, state){
           return SimplePage();
        }
      ),

      GoRoute(
          path: '/simple-detail/:id',
          pageBuilder: (context, state){
            return NoTransitionPage(child: SimpleDetailPage(text: state.pathParameters['id']! ,));
          }
      ),

      GoRoute(
          path: '/grid-page',
          builder: (context, state){
            return GridPage();
          }
      ),


      GoRoute(
          path: '/detail-page',
          builder: (context, state){
            return DetailPage(book: state.extra as Book,);
          }
      )

    ]
);
