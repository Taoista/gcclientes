import 'package:dio/dio.dart';
import 'package:geoclientes/config/configuration.dart';

class ControllSendFormulario {
  final List formulario;
  final int idVisita;

  ControllSendFormulario({required this.formulario, required this.idVisita});

   formularioSend() {
  
      return {
        "formulario": formulario,
        "id_visita": idVisita,
      };
  }

  Future sendFormular() async {
    Dio dio = Dio();

    try {
      var postData = formularioSend();

      Response response = await dio.post("${urlAmind()}api/form_swtich_visita_cliente",
        data: postData,
      );
      // print(response.data);
      return response.data;
    } catch (e) {
      return "error";
    }
  }
}
