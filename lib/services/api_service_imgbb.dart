import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:typed_data';

class ApiServiceImgbb{

  final XFile imgPath;

  ApiServiceImgbb({required this.imgPath});

  String apiKey = "2f5842f29fbe5fbf35650b0395f48ea0";

  // Future<String?> uploadImageToImgBB() async {
  //   try {
  //     String apiUrl = 'https://api.imgbb.com/1/upload';
      
  //     Dio dio = Dio();

  //     FormData formData = FormData.fromMap({
  //       'key': apiKey,
  //       'image': await MultipartFile.fromFile(imgPath.path),
  //     });

  //     Response response = await dio.post(apiUrl, data: formData);

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = response.data;
  //       final imageUrl = data['data']['url'];
  //       return imageUrl;
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     return null;
  //   }
  // }

  Future<String?> uploadImageToImgBB() async {
    try {
      String apiUrl = 'https://api.imgbb.com/1/upload';

      // Obtener el contenido de la imagen en bytes
      List<int> imageBytes = await File(imgPath.path).readAsBytes();

      // Comprimir la imagen con calidad ajustable (puedes ajustar el valor según tus necesidades)
      Uint8List compressedImageBytes = await FlutterImageCompress.compressWithList(
        Uint8List.fromList(imageBytes),
        quality: 10,
      );

      Dio dio = Dio();

      FormData formData = FormData.fromMap({
        'key': apiKey,
        'image': MultipartFile.fromBytes(compressedImageBytes.toList(), filename: 'compressed_image.jpg'),
      });

      Response response = await dio.post(apiUrl, data: formData);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final imageUrl = data['data']['url'];
        return imageUrl;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

}