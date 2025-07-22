import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

class FireInstances{
  static final fireAuth = FirebaseAuth.instance;
  static final fireStore = FirebaseFirestore.instance;
  static final fireChat = FirebaseChatCore.instance;
}