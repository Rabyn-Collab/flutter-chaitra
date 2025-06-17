import 'package:flutter_chaitra/feature/auth/repository/auth_repository.dart';
import 'package:flutter_chaitra/feature/shared/user_state_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'auth_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build()  {}

  Future<void> userLogin(Map<String, dynamic> data) async {
     state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async{
       final user =  await ref.read(authRepositoryProvider).userLogin(data);
       ref.read(userStateControllerProvider.notifier).setUser(user);
      });
  }


}


@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<void> build()  {}
  Future<void> userSignup(Map<String, dynamic> data) async {
     state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async{
        await ref.read(authRepositoryProvider).userSignup(data);
      });
  }
}