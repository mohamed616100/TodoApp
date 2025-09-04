import 'dart:io';
import 'package:dio/dio.dart';

Future<String?> uploadImageToCloudinary(File imageFile) async {
  const cloudName = "dzvdrdh0p";
  const uploadPreset = "flutter_nti";

  final url = "https://api.cloudinary.com/v1_1/$cloudName/image/upload";

  try {
    FormData formData = FormData.fromMap({
      'upload_preset': uploadPreset,
      'file': await MultipartFile.fromFile(imageFile.path),
    });

    final response = await Dio().post(url, data: formData);

    if (response.statusCode == 200) {
      return response.data['secure_url'];
    } else {
      print("Cloudinary Upload Failed: ${response.data}");
      return null;
    }
  } catch (e) {
    print("Cloudinary Error: $e");
    return null;
  }
}
