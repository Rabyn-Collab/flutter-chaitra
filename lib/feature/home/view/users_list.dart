import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/user/view/user_controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UsersList extends ConsumerWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(allUserStreamProvider);
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      child: users.when(
          data: (data){
            return ListView.builder(
              scrollDirection: Axis.horizontal ,
              itemCount: data.length,
              itemBuilder: (context, index) => Column(
                children: [
                  CircleAvatar(),
                  Text(data[index].firstName!),
                ],
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}