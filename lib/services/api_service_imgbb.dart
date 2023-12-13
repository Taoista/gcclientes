import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ApiServiceImgbb{

  final XFile imgPath;

  ApiServiceImgbb({required this.imgPath});

  String apiKey = "2f5842f29fbe5fbf35650b0395f48ea0";

  // _firstPhoto!.path;
  Future<String?> uploadImageToImgBB() async {
    try {
      String apiUrl = 'https://api.imgbb.com/1/upload';
      
      Dio dio = Dio();

      FormData formData = FormData.fromMap({
        'key': apiKey,
        'image': await MultipartFile.fromFile(imgPath.path),
      });

      Response response = await dio.post(apiUrl, data: formData);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final imageUrl = data['data']['url'];
        return imageUrl;
      } else {
        print('Error al subir la imagen: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
}

}