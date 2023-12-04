class Respuesta {
  int? id;
  late String pregunta1;
  late String pregunta2;
  late String? comentario;
  late int idCategoira;
  late String? ci;
  late String? fecha;

  Respuesta({
    this.id,
    required this.pregunta1,
    required this.pregunta2,
    this.comentario,
    required this.idCategoira,
    this.ci,
    this.fecha,
  });

  Respuesta.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    pregunta1 = json['pregunta1'];
    pregunta2 = json['pregunta2'];
    comentario = json['comentario'];
    idCategoira = json['idCategoira'];
    fecha = json['fecha'];
    ci = json['ci'];
  }

  Map<String, dynamic> toMap() {
    return {
      'pregunta1': pregunta1,
      'pregunta2': pregunta2,
      'comentario': comentario,
      'idCategoira': idCategoira,
      'fecha': fecha,
      'ci': ci,
    };
  }

  @override
  String toString() {
    return 'Respuesta: $id, pregunta1 $pregunta1, pregunta2 $pregunta2, idCategoira $idCategoira, comentario $comentario, ci $ci, fecha $fecha ';
  }
}
