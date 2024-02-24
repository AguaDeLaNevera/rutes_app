class Ruta {
  String id;
  String descripcion;
  double distancia;
  String nombre;
  List<String> posicions;
  bool state;
  String userId;

  Ruta({
    required this.id,
    required this.descripcion,
    required this.distancia,
    required this.nombre,
    required this.posicions,
    required this.state,
    required this.userId,
  });

  factory Ruta.fromJson(String id, Map<String, dynamic> json) {
    return Ruta(
      id: id,
      descripcion: json['descripcion'],
      distancia: json['distancia'].toDouble(),
      nombre: json['nombre'],
      posicions: List<String>.from(json['posicions']),
      state: json['state'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'descripcion': descripcion,
      'distancia': distancia,
      'nombre': nombre,
      'posicions': posicions,
      'state': state,
      'user_id': userId,
    };
  }
}
