import 'package:flutter/material.dart';
import 'package:flutter_chaitra/common/show_toasts.dart';
import 'package:flutter_chaitra/feature/rooms/view/controllers/room_controller.dart';
import 'package:flutter_chaitra/feature/user/view/user_controllers.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';



class UserPage extends ConsumerWidget {
  final  types.User user;
  const UserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(roomControllerProvider, (previous, next) {
      next.maybeWhen(
        data: (value) {
          context.pushNamed(AppRoute.chat.name, extra: value);
        },
        error: (error, stackTrace) => Toasting.showErrorToast(error.toString()),
        orElse: () => null,
      );
    });
    final posts = ref.watch(userPostStreamProvider(userId: user.id));
    final roomState = ref.watch(roomControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.imageUrl!),
                  radius: 40,
                ),
                Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(user.firstName!),
                    Gap(5),
                    Text(user.metadata!['email']!),
                    Gap(10),
                    ElevatedButton(
                        onPressed: roomState.isLoading ? null : (){
                          ref.read(roomControllerProvider.notifier).createRoom(user);
                        },
                        child: roomState.isLoading ? const CircularProgressIndicator() : Text('Send Message'))
                  ],
                ),
              ],
            ),
            Gap(20),
            posts.when(data: (data){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final post = data[index];
                  return ListTile(
                    title: Text(post.title),
                    leading: CircleAvatar(backgroundImage: NetworkImage(post.image),),
                    subtitle: Text(post.body),
                  );
                },
              );
            }, error: (error, stackTrace) => Text(error.toString()), loading: () => const Center(child: CircularProgressIndicator()),),
          ],
        ),
      ),
    );
  }
}
