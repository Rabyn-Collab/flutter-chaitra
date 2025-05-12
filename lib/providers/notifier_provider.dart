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

  void removeUser(String user){
    state = state.where((element) => element != user).toList();
  }

}

final userProvider = NotifierProvider<UserProvider, List<String>>(() => UserProvider());



class ThemeProvider extends Notifier<bool>{
  @override
  bool build() {
    return false;
  }
  void changeTheme(){
    state = !state;
  }

}

final themeProvider = NotifierProvider<ThemeProvider, bool>(() => ThemeProvider());