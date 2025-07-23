import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chaitra/feature/shared/fire_instances.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

part 'user_controllers.g.dart';

@riverpod
Stream<User?> userStream (Ref ref) {
  return FireInstances.fireAuth.authStateChanges();
}

@riverpod
Stream<List<types.User>> allUserStream (Ref ref) {
  return FireInstances.fireChat.users();
}



@riverpod
Stream<types.User> userProfileStream(Ref ref) {
  final userId = FireInstances.fireChat.firebaseUser?.uid;
  final userDb = FireInstances.fireStore.collection('users');
 return userDb.doc(userId).snapshots().map((event){
   final map = event.data()!;
   return types.User(
     id: event.id,
     firstName: map['firstName'],
     metadata: map['metadata'],
   );
 });
}