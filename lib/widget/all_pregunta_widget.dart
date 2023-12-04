import 'package:at_cliente_upds/db/db_helper.dart';
import 'package:at_cliente_upds/model/categoria.dart';
import 'package:at_cliente_upds/model/respuesta.dart';
import 'package:at_cliente_upds/screen/video_intro_screen.dart';
import 'package:at_cliente_upds/theme/colors.dart';
import 'package:at_cliente_upds/theme/style_text.dart';
import 'package:flutter/material.dart';

class AllPreguntaWidget extends StatefulWidget {
  final Categoria categoria;
  const AllPreguntaWidget({super.key, required this.categoria});

  @override
  State<AllPreguntaWidget> createState() => _AllPreguntaWidgetState();
}

class _AllPreguntaWidgetState extends State<AllPreguntaWidget> {
  late DBHelper dbHelper;

  int currentPage = 0;
  PageController pageController = PageController();
  bool seleccionada = false;
  bool saltaPregunta = false;
  bool esUltimaPregunta = false;
  bool mostrarSiguiente = false;
  late String opcionSeleccionada = '';
  int preguntaActual = 0;

  String? pregunta1;
  String? pregunta2;
  String? comentario = 'Sin comentarios';

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    dbHelper = DBHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).size.height * 0.01;
    //final Orientation orientation = MediaQuery.of(context).orientation;
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: widget.categoria.preguntas.length,
            itemBuilder: (context, index) {
              final preguntaData = widget.categoria.preguntas[index];
              List<dynamic> respuestasSeleccionada = List.filled(
                  preguntaData.opciones.length, null,
                  growable: false);
              Widget preguntaWidget;
              if (preguntaData.tipo == 'seleccion') {
                preguntaWidget = SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: preguntaData.opciones.length,
                      itemBuilder: (context, i) {
                        return RadioListTile(
                          title: Text(
                            preguntaData.opciones[i].text,
                            style: TextStyle(fontSize: textScale * 3),
                          ),
                          value: preguntaData.opciones[i].text,
                          groupValue: preguntaActual == currentPage
                              ? opcionSeleccionada
                              : null, // respuestasSeleccionada[i],
                          activeColor: upds,
                          selectedTileColor: upds,
                          dense: true,
                          onChanged: (value) {
                            setState(() {
                              if (preguntaActual == 0) {
                                pregunta1 = value;
                              } else if (preguntaActual == 1) {
                                pregunta2 = value;
                              }
                              seleccionada = true;
                              respuestasSeleccionada[i] = value;
                              if (respuestasSeleccionada[i] == 'Si') {
                                saltaPregunta = true;
                              } else {
                                saltaPregunta = false;
                              }
                            });
                            if (seleccionada) {
                              _siguientePregunta();
                            }
                          },
                        );
                      },
                    ),
                  ),
                );
              } else {
                preguntaWidget = Column(
                  children: [
                    TextField(
                      style: const TextStyle(fontSize: 30),
                      decoration: const InputDecoration(
                          labelText: 'Ingrese un comentario',
                          hintText: 'Escribe tu comentario aquí',
                          contentPadding: EdgeInsets.all(5)),
                      onChanged: (value) {
                        setState(() {
                          comentario = value;
                        });
                      },
                    ),
                  ],
                );
              }
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: StyleTextot(
                          text: preguntaData.pregunta,
                          colors: negro,
                          size: 3 * textScale,
                          fontweight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 70),
                      preguntaWidget,
                    ],
                  ),
                ),
              );
            },
            onPageChanged: (int page) {
              setState(() {
                esUltimaPregunta =
                    (page == widget.categoria.preguntas.length - 1);
                if (page == 3) {
                  mostrarSiguiente = true;
                }
              });
            },
          ),
        ),
        Column(
          children: [
            if (!esUltimaPregunta)
              Visibility(
                visible: mostrarSiguiente,
                child: RawMaterialButton(
                  onPressed: _siguientePregunta,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(15),
                  splashColor: updsletras,
                  highlightColor: upds,
                  fillColor: upds,
                  child: const StyleTextot(
                    text: 'Siguiente',
                    size: 30,
                    colors: negro,
                  ),
                ),
              ),
            if (esUltimaPregunta)
              RawMaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22.0))),
                          contentPadding: const EdgeInsets.only(top: 10.0),
                          scrollable: true,
                          title: const Center(
                            child: StyleTextot(
                              text: 'GRACIAS',
                              colors: updsletras,
                              size: 30,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                          content: SizedBox(
                            width: 300.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                /*Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      labelText: 'Ingrese un CI',
                                      hintText: 'Escribe tu CI aquí',
                                    ),
                                    onChanged: (value) {},
                                  ),
                                ),*/
                                const SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  onTap: () {
                                    dbHelper.addRespuesta(Respuesta(
                                        pregunta1: pregunta1!,
                                        pregunta2: pregunta2!,
                                        comentario: comentario!,
                                        idCategoira: widget.categoria.id));
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute<void>(
                                            builder: (BuildContext context) {
                                      return const VideoIntroScreen();
                                    }), (Route<dynamic> route) => false);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 20.0),
                                    decoration: const BoxDecoration(
                                      color: upds,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(22.0),
                                          bottomRight: Radius.circular(22.0)),
                                    ),
                                    child: const Text(
                                      "Salir",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                shape: const StadiumBorder(),
                padding: const EdgeInsets.all(15),
                splashColor: updsletras,
                highlightColor: upds,
                fillColor: upds,
                child: const StyleTextot(
                  text: 'ENVIAR',
                  size: 30,
                  colors: negro,
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }

  void _siguientePregunta() {
    setState(() {
      if (preguntaActual == 2) {
        if (saltaPregunta == true) {
          preguntaActual = 4; // Salta a la pregunta 5
        } else {
          preguntaActual = 3; // Avanza a la pregunta 4
        }
      } else {
        preguntaActual++;
      }
    });
    pageController.animateToPage(
      preguntaActual,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
