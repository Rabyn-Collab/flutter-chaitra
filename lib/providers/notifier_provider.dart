import 'package:flutter_riverpod/flutter_riverpod.dart';



// abstract class M {
//   void greet();
// }
//
// class A extends M{
//   @override
//   void greet() {
//     // TODO: implement greet
//   }
//
// }

class UserProvider extends Notifier<List<String>>{
  @override
 List<String> build() {
   return [];
  }

  void addUser(String user){
    state = [...state, user];
  }

}

final userProvider = NotifierProvider<UserProvider, List<String>>(() => UserProvider());