import 'package:dio/dio.dart';

class ControllSendVisita{

  final String emailVendedor;
  final String codigoCliente;
  final String latitud;
  final String longitud;
  final String nota;
  final List<dynamic> listaImagenes;

  ControllSendVisita({required this.emailVendedor, required this.codigoCliente, required this.latitud,
                      required this.longitud, required this.nota, required this.listaImagenes});

  Dio dio = Dio();

  Map visita(){
    Map<String, dynamic> postData = {
      'email_vendedor': emailVendedor,
      'codigo_cliente': codigoCliente,
      'latitud' : latitud,
      'longitud': longitud,
      'nota': nota,
      'lista_imagenes':listaImagenes
    };
    return postData;
  }

  Future sendData() async {
    try {
      var postData = visita();
      // Response response = await dio.post("https://admin-neumachile.cl/api/create_new_visita"
      Response response = await dio.post("http://localhost:8000/api/create_new_visita"
        , data: postData);
        return response.data;
    } catch (e) {
      print(e);
      return "error";
    }
  }


}