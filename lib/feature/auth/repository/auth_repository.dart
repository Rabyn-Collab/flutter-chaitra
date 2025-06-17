import 'package:dio/dio.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/exceptions/api_exception.dart';
import 'package:flutter_chaitra/feature/auth/models/user.dart';
import 'package:flutter_chaitra/feature/shared/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';


class AuthRepository {

final Dio client;

AuthRepository({required this.client});

Future<Map<String, dynamic>> userLogin(Map<String, dynamic> data) async {
  try{
    final response = await client.post(login, data: data);
    return response.data;
  }on DioException catch(err){

    throw ApiException(err).errorMessage;
  }
}

Future<void> userSignup(Map<String, dynamic> data) async {
  try{
     await client.post(register, data: data);
  }on DioException catch(err){

    throw ApiException(err).errorMessage;
  }
}
}

@riverpod
AuthRepository authRepository (Ref ref) {
  return AuthRepository(client: ref.watch(clientProvider));
}