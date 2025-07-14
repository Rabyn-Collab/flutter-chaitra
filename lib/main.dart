import 'package:flutter/material.dart';
import 'package:flutter_chaitra/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'feature/cart/model/cart_item.dart';

part 'main.g.dart';


@riverpod
Box hiveBox (Ref ref) {
  throw UnimplementedError();
}

@riverpod
List<CartItem> cartBox (Ref ref) {
  throw UnimplementedError();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
   Hive.registerAdapter(CartItemAdapter());
   final cartBox = await Hive.openBox<CartItem>('carts');
  final box = await Hive.openBox('box');
  runApp(ProviderScope(
      overrides: [
        cartBoxProvider.overrideWithValue(cartBox.values.toList()),
       hiveBoxProvider.overrideWithValue(box)
      ],
      child: const App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorSchemeSeed: Color(0xFFD4AF37), // Gold seed
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFB8860B), // Dark Gold
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF5A5A5A), // Neutral dark gray for contrast
              width: 2.0,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFB8860B), // Dark Gold
            foregroundColor: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
