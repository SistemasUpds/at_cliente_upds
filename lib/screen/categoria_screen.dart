import 'package:at_cliente_upds/model/categoria.dart';
import 'package:at_cliente_upds/screen/video_intro_screen.dart';
import 'package:at_cliente_upds/theme/colors.dart';
import 'package:at_cliente_upds/theme/style_text.dart';
import 'package:at_cliente_upds/widget/all_pregunta_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final Categoria categoria;
  const CategoryScreen({super.key, required this.categoria});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    // Iniciar un temporizador de 1 minuto
    Future.delayed(const Duration(minutes: 1), () {
      // Redirigir a la página principal después de 1 minuto
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<void>(builder: (BuildContext context) {
        return const VideoIntroScreen();
      }), (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: negro,
          title: StyleTextot(
            text: widget.categoria.catNombre,
            colors: updsletras,
            size: 30,
            fontweight: FontWeight.bold,
          ),
          elevation: 0,
          shadowColor: blanco,
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(orientation == Orientation.landscape ? 30 : 70),
            child: Container(
              alignment: Alignment.centerLeft,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [blanco, updsbarra],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/profecionales+humanos.png'),
              fit: BoxFit.scaleDown,
              opacity: 0.5,
              scale: 0.6,
              alignment: Alignment(0, 0.8),
            ),
          ),
          child: AllPreguntaWidget(
            categoria: widget.categoria,
          ),
        ),
      ),
    );
  }
}
