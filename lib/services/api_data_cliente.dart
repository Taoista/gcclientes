import 'package:dio/dio.dart';
import 'package:geoclientes/config/clientes.dart';

class ApiDataCliente{
  String codigoCliente;

  ApiDataCliente({required this.codigoCliente});


  var dio = Dio();


  Future<Cliente> fetchClientes() async{

    try {
      final response = await dio.get("https://admin-neumachile.cl/api/get_data_cliente_codigo/$codigoCliente");
      if(response.statusCode == 200){
        final List<dynamic> jsonData = response.data as List<dynamic>;
        final List<Cliente> cliente = jsonData.map((item) => Cliente.fromJson(item)).toList();
        return cliente[0];
      }else{
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e);
    }

  }

}