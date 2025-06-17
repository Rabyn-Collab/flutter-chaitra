import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/shared/user_state_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';


class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userStateControllerProvider);
    return Drawer(
      child: ListView(
        children: [

          DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 20,

                  ),
                  const Gap(10),
                  Text(user.username),
                  Text('Role: ${user.role}'),
                  Text(user.email),
                ],
              )
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: (){
              ref.read(userStateControllerProvider.notifier).clearUser();
            },
          )

        ],
      ),
    );
  }
}
