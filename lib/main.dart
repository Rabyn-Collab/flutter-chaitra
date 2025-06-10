import 'package:flutter/material.dart';
import 'package:flutter_chaitra/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



/// provider, notifier_provider, future_provider, async_notifier_provider, stream_provider


// Future<String> some() async {
//    await Future.delayed(const Duration(seconds: 2));
//    throw SomeException('something went wrong');
// }

// class SomeException implements Exception {
//   final String message;
//   SomeException(this.message);
//
//   // @override
//   // String toString() => message;
// }

// class M {
//   final String message = 'hello';
//   M(this.message);
// }
void main ()async {

  // try{
  //   // await some();
  // }catch (err){
  //    print(err);
  // }

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
