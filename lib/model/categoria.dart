import 'package:at_cliente_upds/model/pregunta.dart';

class Categoria {
  final int id;
  final String catNombre;
  final List<Pregunta> preguntas;
  final String icon;

  Categoria({
    required this.id,
    required this.preguntas,
    required this.catNombre,
    required this.icon,
  });
}
