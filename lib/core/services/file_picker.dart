import 'package:image_picker/image_picker.dart';

import '../data/api/api_requests.dart';
import '../ui_helper/toast.dart';

class AppFilePicker {
  static Future<UploadFileHelper?> pickImage(int src) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.values[src],
    );
    if (image != null) {
      int sizeInBytes = await image.length();
      double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb > 20) {
        ToastHelper.showToast(
            text: "File Oversize", status: SnakeBarStatus.note);
        return null;
      }
      final stream = await image.readAsBytes();
      return UploadFileHelper(
        stream,
        image.name,
        sizeInBytes,
        image.path,
      );
    }
    return null;
  }

  static Future<UploadFileHelper?> pickVideo(int src) async {
    final ImagePicker picker = ImagePicker();
    final XFile? video = await picker.pickVideo(
      source: ImageSource.values[src],
      maxDuration: const Duration(seconds: 45),
    );
    if (video != null) {
      int sizeInBytes = await video.length();
      double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb > 70) {
        ToastHelper.showToast(
            text: "File Oversize", status: SnakeBarStatus.error);
        return null;
      }
      final stream = await video.readAsBytes();
      return UploadFileHelper(
        stream,
        video.name,
        sizeInBytes,
        video.path,
      );
    }
    return null;
  }
}
