import 'package:dio/dio.dart';
import 'package:geoclientes/config/configuration.dart';
import 'package:geoclientes/config/formulario.dart';
import 'package:geolocator/geolocator.dart';



class ControllFormulario{

  var dio = Dio();

  Future<List<Formulario>> getFormulario() async {

    try {
      final response = await dio.get("${urlAmind()}api/checking-questionary");
      
      if(response.statusCode == 200){
        final List<dynamic> jsonData = response.data;
        final List<Formulario> formularios = jsonData.map((item) => Formulario.fromJson(item)).toList();
        return formularios;
      }else{
        throw Exception("error");
      }
    } catch (e) {
        throw Exception("error");
      
    }

  }

}