import 'package:flutter_riverpod/flutter_riverpod.dart';

String someText = 'world';

class Some{

  final someText = 'hello';
  void someMethod() {
    print('someMethod');
  }

  void someOtherMethod() {
    print('someOtherMethod');
  }
}


final someProvider = Provider((ref) => Some());
final someProvider1 = Provider((ref) => 'hi this is normal text yio');
final someProvider2 = Provider((ref) => 9000);
final someProvider3 = Provider((ref) => ['hello', 'sello', 'kello']);


