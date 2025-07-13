
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pass_controller.g.dart';


@riverpod
class PassController extends _$PassController {
  @override
  bool build(int index) {
    return  true;
  }

  void toggle() {
    state = !state;
  }

}



