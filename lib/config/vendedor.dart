class Vendedor {
  final int estado;
  final String nombre;
  final String email;
  final String telefono;

  Vendedor({
    required this.estado,
    required this.nombre,
    required this.email,
    required this.telefono,
  });

  factory Vendedor.fromJson(Map<String, dynamic> json) {
    return Vendedor(
      estado: json['estado'] ?? 0,
      nombre: json['nombre'],
      email: json['email'],
      telefono: json['telefono'] ?? '',
    );
  }
}