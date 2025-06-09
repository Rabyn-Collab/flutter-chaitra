import 'package:flutter/material.dart';
import 'package:flutter_chaitra/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



/// provider, notifier_provider, future_provider, async_notifier_provider, stream_provider





void main ()async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
      overrides: [],
      child: Main()));
}




class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
