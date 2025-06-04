import 'package:flutter/material.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:go_router/go_router.dart';


class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: (value) {
          if(controller.text.isNotEmpty){
            FocusScope.of(context).unfocus();
            context.pushNamed(AppRoute.search.name, extra: controller.text);
            controller.clear();
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(10),
          suffixIcon:  IconButton(onPressed: (){
            if(controller.text.isNotEmpty){
              FocusScope.of(context).unfocus();
              context.pushNamed(AppRoute.search.name, extra: controller.text);
              controller.clear();
            }
          }, icon: Icon(Icons.search)),
          hintText: 'Search news',
        ),
      ),
    );
  }
}
