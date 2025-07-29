import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/rooms/view/controllers/room_controller.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class RecentChats extends ConsumerWidget {
  const RecentChats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomState = ref.watch(getRoomsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Chats'),
      ),
      body: roomState.when(
        data: (data){
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final room = data[index];
            return ListTile(
              onTap: (){
                context.pushNamed(AppRoute.chat.name, extra: room);
              },
              leading: CircleAvatar(backgroundImage: NetworkImage(room.imageUrl!),),
              title: Text(room.name!),
            );
          });
      }, error: (error, stackTrace) => Text(error.toString()), loading: () => Center(child: CircularProgressIndicator()),),
    );
  }
}