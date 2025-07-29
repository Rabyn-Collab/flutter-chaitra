import 'package:flutter_chaitra/feature/auth/view/login.dart';
import 'package:flutter_chaitra/feature/auth/view/signup.dart';
import 'package:flutter_chaitra/feature/chat/%20view/chat_page.dart';
import 'package:flutter_chaitra/feature/chat/%20view/recent_chats.dart';
import 'package:flutter_chaitra/feature/home/view/home.dart';
import 'package:flutter_chaitra/feature/posts/model/post.dart';
import 'package:flutter_chaitra/feature/posts/view/post_add_form.dart';
import 'package:flutter_chaitra/feature/posts/view/post_update_form.dart';
import 'package:flutter_chaitra/feature/user/view/user_page.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;


import '../feature/user/view/user_controllers.dart';

part 'app_routes.g.dart';

@riverpod
GoRouter goRoute(Ref ref) {
  final userState = ref.watch(userStreamProvider);
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final authenticated = userState.valueOrNull != null;
      final authenticating =
          (state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup');
      if (authenticated == false) {
        return authenticating ? null : '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const Home()
      ),

      GoRoute(
          path: '/chats',
          name: AppRoute.chat.name,
          builder: (context, state) => ChatPage(room:  state.extra as types.Room,)
      ),
      GoRoute(path: '/recent-chats',
          name: AppRoute.recentChats.name,
          builder: (context, state) => const RecentChats()
      ),
      GoRoute(
          path: '/user-page',
          name: AppRoute.userPage.name,
          builder: (context, state) => UserPage(user:  state.extra as types.User,)
      ),
      GoRoute(
          path: '/post-add',
          name: AppRoute.postAdd.name,
          builder: (context, state) => const PostAddForm()
      ),
      GoRoute(
          path: '/post-update',
          name: AppRoute.postUpdate.name,
          builder: (context, state) => PostUpdateForm(post: state.extra as Post,)
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/signup',
        name: AppRoute.signup.name,
        builder: (context, state) => const SignUp(),
      ),
    ],
  );
}
