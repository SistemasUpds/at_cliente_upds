class Pregunta {
  int? id;
  late String pregunta;
  final List<Opcion> opciones;
  late String tipo;

  Pregunta({
    this.id,
    required this.opciones,
    required this.pregunta,
    required this.tipo,
  });
}

class Opcion {
  final String text;

  Opcion(this.text);
}

class PreguntasGeneral {
  late String pregunta;

  PreguntasGeneral({
    required this.pregunta,
  });
}
