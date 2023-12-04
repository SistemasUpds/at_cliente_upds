import 'package:at_cliente_upds/data/categoria_data.dart';
import 'package:at_cliente_upds/theme/colors.dart';
import 'package:at_cliente_upds/widget/all_reports_widget.dart';
import 'package:flutter/material.dart';

class ReporteScreen extends StatefulWidget {
  const ReporteScreen({super.key});

  @override
  State<ReporteScreen> createState() => _ReporteScreenState();
}

class _ReporteScreenState extends State<ReporteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blanco,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0, 0.6],
                    colors: [blanco, updsbarra],
                  ),
                ),
                height: MediaQuery.of(context).size.height * .18,
                padding: const EdgeInsets.only(top: 10, left: 30, right: 90),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          icon: const Icon(Icons.arrow_back),
                          color: negro,
                        ),
                        Text(
                          "${categorias.length} CATEGORIAS",
                          style: const TextStyle(
                            color: updsletras,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .17,
                right: 15.0,
                left: 15.0),
            child: ListView.builder(
              primary: false,
              itemBuilder: (context, index) => CategoryReportWidget(
                categorias: categorias,
                categoria: categorias[index],
              ),
              itemCount: categorias.length,
            ),
          ),
        ],
      ),
    );
  }
}
