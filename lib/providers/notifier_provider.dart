import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notifier_provider.g.dart';





@riverpod
class TodoController extends _$TodoController {
  @override
  List<String> build() {
    return [];
  }

  void addTodo(String todo){
    state = [...state, todo];
  }
}
