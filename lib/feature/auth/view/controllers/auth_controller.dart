import 'package:flutter_chaitra/feature/auth/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';


@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {}

  Future<void> login({required String email, required String password}) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).login(email: email, password: password));
  }
}


@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<void> build()  {}
  Future<void> signUp({required String username, required String email, required String password}) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).signUp(username: username, email: email, password: password));
  }
}