import 'package:flutter_riverpod/flutter_riverpod.dart';



class CounterProvider extends Notifier<List<String>>{
  @override
  List<String> build() {
    return [];
  }

  void increment (){
     state = [...state, 'hello'];
  }

}

final counterProvider = NotifierProvider<CounterProvider, List<String>>(() => CounterProvider());

