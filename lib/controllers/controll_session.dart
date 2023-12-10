import 'package:dio/dio.dart';

class ControllSession{
  final String usuario;
  final String password;

  ControllSession({required this.usuario, required this.password});

  var dio =  Dio();

  Map visita(){
    Map<String, String> postData = {
      'user': usuario,
      'password': password
    };
    return postData;
  }

  Future<Map<String,dynamic>> setLogin() async{
    try {
        var postData = visita();

        Response response = await dio.post("https://admin-neumachile.cl/api/login_state_user"
        , data: postData);

        return response.data;

    } catch (e) {
      return {'error': e};
    }
  }
  

}