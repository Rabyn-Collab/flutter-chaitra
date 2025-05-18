import 'package:flutter/material.dart';
import 'package:flutter_chaitra/models/user.dart';
import 'package:flutter_chaitra/providers/notifier_provider.dart';
import 'package:flutter_chaitra/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';



final boxProvider = Provider<List<User>>((ref) => []);

/// provider, notifier_provider, future_provider, async_notifier_provider, stream_provider

void main () async{
  //  List<int> state = [1,2,3,4,5,6];
  // //  state = state.where((element) => element != 1).toList();
  //
  //  final m = state.where((n) => n !=3).toList();
  //
  //  print(m);
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  final hiveBox = await Hive.openBox<User>('box');

  runApp(ProviderScope(
      overrides: [
        boxProvider.overrideWithValue(hiveBox.values.toList())
      ],
      child: Main()));
}




class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp.router(
      theme: theme ? ThemeData.dark(): ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
