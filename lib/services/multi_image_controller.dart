import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:image_picker/image_picker.dart';

// XFile → ImageFile 변환 함수 사용
Future<List<ImageFile>> pickImagesUsingImagePicker(int pickCount) async {
  final ImagePicker picker = ImagePicker();
  final List<XFile>? images = await picker.pickMultiImage();
  if (images == null) return [];
  // XFile 리스트를 ImageFile 리스트로 변환
  return images.map((xfile) => convertXFileToImageFile(xfile)).toList();
}

class MyMultiImageController {
  final MultiImagePickerController controller = MultiImagePickerController(
    maxImages: 100,
    picker: (int pickCount, Object? params) async {
      return await pickImagesUsingImagePicker(pickCount);
    },
  );
}
