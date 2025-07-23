import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/auth/view/controllers/auth_controller.dart';
import 'package:flutter_chaitra/feature/user/view/user_controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userState = ref.watch(userProfileStreamProvider);
    return Drawer(
      child:   ListView(
        padding: EdgeInsets.zero,
        children:  [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: userState.when(data: (data){
              return  Column(
                children: [
                  Text(data.firstName!),
                  Text(data.metadata!['email']!),
                ],
              );
            }, error: (error, stackTrace) => Text(error.toString()), loading: () => Center(child: CircularProgressIndicator()),),
          ),

          ListTile(
            onTap: (){
              ref.read(signOutControllerProvider.notifier).logOut();
            },
            title: Text('Sign Out'),
            leading: Icon(Icons.logout),
          ),

        ],
      ),
    );
  }
}
