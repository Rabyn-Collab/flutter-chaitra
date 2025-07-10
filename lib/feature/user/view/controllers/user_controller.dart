import 'package:flutter_chaitra/feature/shared/user_state_controller.dart';
import 'package:flutter_chaitra/feature/user/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<void> build()  {}

  Future<void> profileUpdate(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard( () async {
      await ref.read(userRepositoryProvider).profileUpdate(data);
      ref.read(userStateControllerProvider.notifier).setUser(data);
    });
  }
}
