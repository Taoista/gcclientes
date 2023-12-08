class Cliente{
  String codigo;
  String rut;
  String nombre;
  String telefono;
  String telefono2;
  String pContacto;

  Cliente({ required this.codigo,
    required this.rut,
    required this.nombre,
    required this.telefono,
    required this.telefono2,
    required this.pContacto,});

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      codigo: json['codigo'],
      rut: json['rut'],
      nombre: json['nombre'],
      telefono: json['telefono'],
      telefono2: json['telefono_2'],
      pContacto: json['p_contacto'] ?? "",
    );
  }


}