import 'package:dio/dio.dart';
import 'package:geoclientes/config/configuration.dart';

class ControllSendVisita{

  final String emailVendedor;
  final String codigoCliente;
  final String latitud;
  final String longitud;
  final String nota;
  final String? userEmail;
  final List<dynamic> listaImagenes;

  ControllSendVisita({required this.emailVendedor, required this.codigoCliente, required this.latitud,
                      required this.longitud, required this.nota, required this.listaImagenes, required this.userEmail});

  Dio dio = Dio();

  Map visita(){
    Map<String, dynamic> postData = {
      'email_vendedor': emailVendedor,
      'email_rgister': userEmail,
      'codigo_cliente': codigoCliente,
      'latitud' : latitud,
      'longitud': longitud,
      'nota': nota,
      'lista_imagenes':listaImagenes,
      'userEmail': listaImagenes // ! no se usa verificar
    };
    return postData;
  }

  // "email_vendedor": "demo@neumachile.cl",
  // "email_rgister": "avillegas@neumachile.cl",
  // "codigo_cliente": "16803933",
  // "latitud": 40.7128,
  // "longitud": -74.0060,
  // "nota": "de json",
  // "lista_imagenes": ["imagen1.jpg", "imagen2.jpg"]

  Future sendData() async {
    // print("hola mund$userEmail");
    try {
      var postData = visita();
      Response response = await dio.post("${urlAmind()}api/create_new_visita"
        , data: postData);
        return response.data;
    } catch (e) {
      return "error";
    }
  }


}