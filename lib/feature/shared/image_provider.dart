import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_provider.g.dart';


@riverpod
class ImageController extends _$ImageController {
  @override
  XFile? build() {
    return  null;
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    state = image;
  }
}