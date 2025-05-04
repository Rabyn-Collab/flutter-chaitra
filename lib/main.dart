import 'package:flutter/material.dart';
import 'package:flutter_chaitra/pages/grid_page.dart';
import 'package:flutter_chaitra/pages/home_page.dart';
import 'package:flutter_chaitra/routes/app_routes.dart';




void main (){

  // List numbers = [11,22,33,44,55];
  // final newNumbers = numbers.map((n){
  //   return n * 2;
  // }).toList();
  //
  // print(newNumbers);

  runApp(Home());

}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        scaffoldBackgroundColor: Color(0xFFF1F5F9)
      ),
    );
  }
}





