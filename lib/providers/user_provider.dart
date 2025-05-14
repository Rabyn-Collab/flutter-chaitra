import 'package:flutter_chaitra/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class UserDetailProvider extends Notifier<List<User>>{
  @override
  List<User> build() {
     return [];
  }


  void addUserDetail(Map<String, dynamic> user) {
    state = [...state, User.fromJson(user)];
  }


}


final userDetailProvider = NotifierProvider<UserDetailProvider, List<User>>(() => UserDetailProvider());