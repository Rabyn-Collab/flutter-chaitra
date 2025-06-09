import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'normal_provider.g.dart';

@riverpod
int counter (Ref ref) {
  return 1;
}

// final counterProvider = Provider((ref) => 1);