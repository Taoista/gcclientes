import 'package:dio/dio.dart';
import 'package:geoclientes/config/vendedor.dart';

class ApiServiceVendedores{

  ApiServiceVendedores();


  var dio = Dio();


  Future<List<Vendedor>> fetchVendedores() async{

    try {
      final response = await dio.get("https://admin-neumachile.cl/api/get_vendedores");
      if(response.statusCode == 200){
        final List<dynamic> jsonData = response.data;
        final List<Vendedor> clientes = jsonData.map((item) => Vendedor.fromJson(item)).toList();
        return clientes;
      }else{
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e);
    }

  }

}