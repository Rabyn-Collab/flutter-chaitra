


import 'package:dio/dio.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/exceptions/api_exception.dart';
import 'package:flutter_chaitra/feature/shared/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepository {

  final Dio client;

  UserRepository({required this.client});

  Future<Map<String, dynamic>> profileUpdate(Map<String, dynamic> data) async {
    try{
      final response = await client.patch(userProfile, data: data);
      return response.data;
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }


}

@riverpod
UserRepository userRepository (Ref ref) {
  return UserRepository(client: ref.watch(authClientProvider));
}