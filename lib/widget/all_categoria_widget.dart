import 'package:at_cliente_upds/model/categoria.dart';
import 'package:at_cliente_upds/screen/categoria_screen.dart';
import 'package:at_cliente_upds/theme/colors.dart';
import 'package:at_cliente_upds/theme/style_text.dart';
import 'package:flutter/material.dart';

class AllCategoryWidget extends StatelessWidget {
  final Categoria categoria;
  const AllCategoryWidget({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).size.height * 0.01;
    final Orientation orientation = MediaQuery.of(context).orientation;
    var sizeText = orientation == Orientation.landscape ? 4 : 1.5;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryScreen(
                categoria: categoria,
              ))),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: upds,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StyleTextot(
              colors: updsletras,
              text: categoria.catNombre,
              size: sizeText * textScale,
              fontweight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
