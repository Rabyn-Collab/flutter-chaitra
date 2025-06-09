import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'future_provider.g.dart';


@riverpod
Future<String> someFuture (Ref ref) async {
  return ApiRepo().getData();
}

class ApiRepo{
  
  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 3));
    return "Hello";
  }
  
}