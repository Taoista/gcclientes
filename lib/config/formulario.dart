class Formulario{

  int id;
  int estado;
  String tipo;
  String pregunta;

  Formulario({required this.id, required this.estado, required this.tipo, required this.pregunta});

  factory Formulario.fromJson(Map<String, dynamic> json) {
    return Formulario(
      id: json['id'] as int,
      estado: json['estado'] as int,
      tipo: json['tipo'] as String,
      pregunta: json['pregunta'].toUpperCase() as String,
    );
  }
}

