import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:geoclientes/config/configuration.dart';

class ControllSendFormulario {
  final List formulario;

  ControllSendFormulario({required this.formulario});

   formularioSend() {
    print(jsonEncode(formulario));
    // return formulario;
    return {
      'formulario': jsonEncode(formulario),
    };
  }

  Future sendFormular() async {
    Dio dio = Dio();

    try {
      var postData = formularioSend();

      Response response = await dio.post("${urlAmind()}api/form_swtich_visita_cliente",
        data: postData,
      );
      return response.data;
    } catch (e) {
      print(e);
      return "error";
    }
  }
}
