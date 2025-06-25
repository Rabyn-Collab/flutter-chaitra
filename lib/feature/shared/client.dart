import 'package:dio/dio.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/feature/shared/user_state_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client.g.dart';


@riverpod
Dio client(Ref ref) {
  return Dio(BaseOptions(baseUrl: baseUrl));
}


@riverpod
Dio authClient(Ref ref) {
  final token = ref.watch(userStateControllerProvider).token;
  return Dio(BaseOptions(baseUrl: baseUrl, headers: {
    'Authorization': token
  }));
}
