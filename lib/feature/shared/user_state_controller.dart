import 'dart:convert';

import 'package:flutter_chaitra/feature/auth/models/user.dart';
import 'package:flutter_chaitra/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_state_controller.g.dart';

@riverpod
class UserStateController extends _$UserStateController {
  @override
  User build() {
    final box = ref.watch(hiveBoxProvider);
    final user = box.get('user');
    return user == null ? User.empty() : User.fromJson(jsonDecode(user));
  }

  void setUser(Map<String, dynamic> user) {
    final box = ref.watch(hiveBoxProvider);
    box.put('user', jsonEncode({...state.toJson(), ...user}));
    state = User.fromJson({...state.toJson(), ...user});
  }

  void clearUser() {
    final box = ref.watch(hiveBoxProvider);
    box.clear();
    state = User.empty();
  }

}
