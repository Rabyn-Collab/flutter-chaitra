import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/user_provider.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
     final users = ref.watch(userDetailProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.input),
            onPressed: () {
              context.pushNamed(AppRoute.form.name);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: users.isEmpty ? const Center(child: Text('Try To add Users'),) : ListView.separated(
            itemBuilder: (context, index){
              final user = users[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 10,),
                              Text(user.username),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              IconButton(onPressed: (){
                                context.pushNamed(AppRoute.form.name, extra: user);
                              }, icon: Icon(Icons.edit)),
                              IconButton(onPressed: (){
                                ref.read(userDetailProvider.notifier).removeUserDetail(user.id);
                              }, icon: Icon(Icons.delete)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 10,),
                          Text(user.phone),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(user.gender == 'male' ?Icons.man: Icons.woman),
                          SizedBox(width: 10,),
                          Text(user.gender),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(width: 10,),
                          Text(user.email),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.flag),
                          SizedBox(width: 10,),
                          Text(user.country),
                        ],
                      ),

                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index){
              return Divider();
            },
            itemCount: users.length
        ),
      ),
    );
  }
}
