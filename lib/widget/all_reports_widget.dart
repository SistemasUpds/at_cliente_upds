import 'package:at_cliente_upds/model/categoria.dart';
import 'package:at_cliente_upds/screen/report_categ_screen.dart';
import 'package:at_cliente_upds/theme/colors.dart';
import 'package:at_cliente_upds/theme/style_icono.dart';
import 'package:flutter/material.dart';

class CategoryReportWidget extends StatelessWidget {
  final Categoria categoria;
  final List<Categoria> categorias;
  const CategoryReportWidget(
      {super.key, required this.categoria, required this.categorias});

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).size.height * 0.01;
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ReporteCategScreen(
                categoria: categoria,
              ),
            ),
          ),
          child: Container(
            padding:
                const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 20.0),
            decoration: BoxDecoration(
                color: blanco, borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: StyleIcono(
                    iconName: categoria.icon,
                    color: updsletras,
                    ancho: 2.5 * textScale,
                    alto: 2.5 * textScale,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              categoria.catNombre,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: updsletras),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
