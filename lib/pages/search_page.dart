import 'package:flutter/material.dart';
import 'package:flutter_chaitra/pages/widgets/search_input.dart';
 class SearchPage extends StatelessWidget {
   const SearchPage({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: ListView(
         children: [
           SearchInput(),
         ],
       ),
     )
   }
 }
