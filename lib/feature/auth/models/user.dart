import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {

  const factory User({
    required String token,
    required String role,
    required String username,
    required String email,
}) = _User;

  factory User.empty() => const User(token: '', role: '', username: '', email: '');
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
