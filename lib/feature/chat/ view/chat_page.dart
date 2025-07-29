import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/chat/%20view/controllers/chat_controller.dart';
import 'package:flutter_chaitra/feature/shared/fire_instances.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatPage extends ConsumerStatefulWidget {
  final types.Room room;
  const ChatPage({super.key, required this.room});

  @override
  ConsumerState createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final msgState = ref.watch(streamMessagesProvider(room:  widget.room));
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: msgState.when(data: (data){
      return Chat(
          messages: data,
          showUserAvatars: true,
          showUserNames: true,
          onSendPressed: (message){
            FireInstances.fireChat.sendMessage(message, widget.room.id);
          },
          user: types.User(
            id: FireInstances.fireChat.firebaseUser!.uid,
          )
      );
      }, error: (error, stackTrace) => Text(error.toString()), loading: () => Center(child: CircularProgressIndicator()),),
    );
  }
}
