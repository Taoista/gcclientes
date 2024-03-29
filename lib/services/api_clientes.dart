import 'package:dio/dio.dart';
import 'package:geoclientes/config/clientes.dart';
import 'package:geoclientes/config/configuration.dart';

class ApiServiceClientes{
  String userMail;

  ApiServiceClientes({required this.userMail});


  var dio = Dio();


  Future<List<Cliente>> fetchClientes() async{
    try {
      final response = await dio.get("${urlPremium()}api/get_clientes/$userMail");
      if(response.statusCode == 200){
        final List<dynamic> jsonData = response.data;
        // print(jsonData);
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