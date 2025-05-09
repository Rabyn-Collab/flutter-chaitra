import 'package:flutter/material.dart';
import 'package:flutter_chaitra/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





/// provider, notifier_provider, future_provider, async_notifier_provider, stream_provider



void main (){
  runApp(ProviderScope(child: Main()));
}


class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
