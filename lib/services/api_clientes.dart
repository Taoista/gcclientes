import 'package:dio/dio.dart';
import 'package:gcclientes/config/clientes.dart';

class ApiServiceClientes{
  String userMail;

  ApiServiceClientes({required this.userMail});


  var dio = Dio();


  Future<List<Cliente>> fetchClientes() async{
    // print(userMail);
    try {
      final response = await dio.get("https://admin-neumachile.cl/api/get_clientes/$userMail");
      print(response.data);
      if(response.statusCode == 200){
        final List<dynamic> jsonData = response.data;
        final List<Cliente> clientes = jsonData.map((item) => Cliente.fromJson(item)).toList();
        return clientes;
      }else{
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e);
    }

  }

}