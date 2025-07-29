import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chaitra/feature/shared/fire_instances.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'rooms_repository.g.dart';


class RoomsRepository {

  RoomsRepository();

  Future<types.Room> createRoom(types.User user) async{
    try{
     final room = await FireInstances.fireChat.createRoom(user);
     return room;
    }on FirebaseException catch(err){
      throw '${err.message}';
    }
  }
}


@riverpod
RoomsRepository roomsRepository (Ref ref) {
  return RoomsRepository();
}