
class Ciudad {
  final int id;
  final int estado;
  final int idRegion;
  final String region;
  final String nombreCiudad;
  // final double costo;

  Ciudad({
    required this.id,
    required this.estado,
    required this.idRegion,
    required this.region,
    required this.nombreCiudad,
    // required this.costo,
  });

  // Constructor de fábrica para crear una instancia de Ciudad desde un mapa
  factory Ciudad.fromJson(Map<String, dynamic> json) {
    return Ciudad(
      id: json['id'] as int,
      estado: json['estado'] as int,
      idRegion: json['id_region'] as int,
      region: json['region'] as String,
      nombreCiudad: json['ciudad'] as String,
      // costo: (json['costo'] as num).toDouble(),
    );
  }
}
