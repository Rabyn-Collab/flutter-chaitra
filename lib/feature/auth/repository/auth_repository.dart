import 'package:dio/dio.dart';
import 'package:flutter_chaitra/feature/shared/client_provider.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chaitra/feature/shared/fire_instances.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository{
  final Dio client;
  AuthRepository({required this.client});
  
  Future<void> login({required String email, required String password}) async{
    try{
      final credential = await FireInstances.fireAuth.signInWithEmailAndPassword(email: email, password: password);
      await OneSignal.login(credential.user!.uid);
    }on FirebaseAuthException catch(e){
      throw '${e.message}';
    }
  }



  Future<void> signUp({required String username, required String email, required String password, required XFile image}) async{
    try{

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(image.path),
      });
    final response =  await client.post('/api/files', data: formData);
     final credential = await FireInstances.fireAuth.createUserWithEmailAndPassword(email: email, password: password);
      await FireInstances.fireChat.createUserInFirestore(
        types.User(
          firstName: username,
          id: credential.user!.uid,
          imageUrl: response.data['secure_url'],
          metadata: {
            'email': email,
            'public_id': response.data['public_id'],
          }
        ),
      );
    }on FirebaseAuthException catch(e){
      throw '${e.message}';
    }
  }

  Future<void> logOut() async{
    try{
      await FireInstances.fireAuth.signOut();
    }on FirebaseAuthException catch(e){
      throw '${e.message}';
    }
  }

}


@riverpod
AuthRepository authRepository  (Ref ref) {
  return AuthRepository(client: ref.watch(dioProvider));
}