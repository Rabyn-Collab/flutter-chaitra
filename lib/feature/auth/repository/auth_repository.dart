import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chaitra/feature/shared/fire_instances.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository{
  
  Future<void> login({required String email, required String password}) async{
    try{
      await FireInstances.fireAuth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      throw '${e.message}';
    }
  }



  Future<void> signUp({required String username, required String email, required String password}) async{
    try{
     final credential = await FireInstances.fireAuth.createUserWithEmailAndPassword(email: email, password: password);
      await FireInstances.fireChat.createUserInFirestore(
        types.User(
          firstName: username,
          id: credential.user!.uid,
          metadata: {
            'email': email
          }
        ),
      );
    }on FirebaseAuthException catch(e){
      throw '${e.message}';
    }
  }
  
  
}


@riverpod
AuthRepository authRepository  (Ref ref) {
  return AuthRepository();
}