import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';







void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const Main()));
}


class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouteProvider);
    return MaterialApp.router(
      title: 'Firebase Chaitra',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}