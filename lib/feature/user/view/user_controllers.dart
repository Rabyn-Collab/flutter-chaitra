import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chaitra/feature/shared/fire_instances.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'user_controllers.g.dart';

@riverpod
Stream<User?> userStream (Ref ref) {
  return FireInstances.fireAuth.authStateChanges();
}
