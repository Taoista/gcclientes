




import 'package:dio/dio.dart';

class ControllSendVisita{

  final String emailVendedor;
  final String codigoCliente;
  final String latitud;
  final String longitud;
  final String nota;

  ControllSendVisita({required this.emailVendedor, required this.codigoCliente, required this.latitud,
                      required this.longitud, required this.nota});

  Dio dio = Dio();

  Map visita(){
    Map<String, String> postData = {
      'email_vendedor': emailVendedor,
      'codigo_cliente': codigoCliente,
      'latitud' : latitud,
      'longitud': longitud,
      'nota': nota
      //  'email_vendedor': 'jriquelme@neumachile.cl',
      // 'codigo_cliente': '10500807',
      // 'latitud' : '1289327',
      // 'longitud': '18293891',
      // 'nota': 'notamde'
    };
    return postData;
  }

  Future sendData() async {
    try {
      var postData = visita();

      Response response = await dio.post("https://admin-neumachile.cl/api/create_new_visita"
        , data: postData);
        return response.data;
    } catch (e) {
      return "error";
    }
  }


}