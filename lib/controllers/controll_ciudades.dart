// http://127.0.0.1:8000/api/
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:geoclientes/config/ciudad.dart';

class ControllCiudades{

  ControllCiudades();

  var dio = Dio();

  Future<List<Ciudad>> fetchCiudades() async{
    try {
      final response = await dio.get("https://admin-neumachile.cl/api/get_regiones_full");
      if(response.statusCode == 200){
         final List<dynamic> jsonData = response.data;
          final List<Ciudad> ciudades = jsonData.map((item) => Ciudad.fromJson(item)).toList();
          // ciudades.sort((a, b) => a.pVenta.compareTo(b.pVenta));
          return ciudades;
      }else{
        throw Exception("Error al buscar con la categoria");
      }
    } catch (e) {
      throw Exception("Error al buscar con la palabra $e");
    }
  }


Map<int, String> getRegionesOrdenadas(List<Ciudad> ciudades) {
  // Crear un mapa ordenado para almacenar id_region y region únicos
  Map<int, String> regionesOrdenadasMap = SplayTreeMap();

  // Iterar sobre las ciudades y agregar cada combinación única al mapa
  for (Ciudad ciudad in ciudades) {
    regionesOrdenadasMap[ciudad.idRegion] = ciudad.region;
  }

  return regionesOrdenadasMap;
}


}