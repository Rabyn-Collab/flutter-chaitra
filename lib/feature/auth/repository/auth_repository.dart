import 'package:dio/dio.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/exceptions/api_exception.dart';
import 'package:flutter_chaitra/feature/auth/models/user.dart';

class AuthRepository {

final Dio client;

AuthRepository({required this.client});

Future<User> userLogin(Map<String, dynamic> data) async {
  try{
    final response = await client.post(login, data: data);
    return User.fromJson(response.data);
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