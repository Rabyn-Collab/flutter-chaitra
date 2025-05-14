import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutovalidateProvider extends Notifier<AutovalidateMode> {
  @override
  AutovalidateMode build() {
    return AutovalidateMode.disabled;
  }


  void change(){
    state = AutovalidateMode.onUserInteraction;
  }

}

final autoValidateModeProvider = NotifierProvider<AutovalidateProvider, AutovalidateMode>(
        () => AutovalidateProvider());