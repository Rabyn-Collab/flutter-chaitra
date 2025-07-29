import 'package:flutter_chaitra/feature/shared/fire_instances.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_controller.g.dart';


@riverpod
Stream<List<types.Message>> streamMessages (Ref ref, {required types.Room room}) {
  return FireInstances.fireChat.messages(room);
}
