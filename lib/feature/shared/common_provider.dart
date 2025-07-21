import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'common_provider.g.dart';


@riverpod
class ValidateMode extends _$ValidateMode {
  @override
  AutovalidateMode build(String label) {
    return AutovalidateMode.disabled;
  }

  void change() {
    state = AutovalidateMode.onUserInteraction;
  }

}


@riverpod
class PassController extends _$PassController {
  @override
  bool build(String label) {
    return  true;
  }

  void change() {
    state = !state;
  }
}
