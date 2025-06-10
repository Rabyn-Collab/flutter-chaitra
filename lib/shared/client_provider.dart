import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'client_provider.g.dart';

@riverpod
Dio client (Ref ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://68414af2d48516d1d35af110.mockapi.io'
    )
  );
}
