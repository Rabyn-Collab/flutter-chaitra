import 'package:flutter_chaitra/feature/rooms/repository/rooms_repository.dart';
import 'package:flutter_chaitra/feature/shared/fire_instances.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'room_controller.g.dart';


@riverpod
class RoomController extends _$RoomController {
  @override
  FutureOr<types.Room?> build()  {
    return null;
  }

  Future<void> createRoom(types.User user) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(roomsRepositoryProvider).createRoom(user));
  }
}


@riverpod
Stream<List<types.Room>> getRooms (Ref ref) {
  return FireInstances.fireChat.rooms();
}