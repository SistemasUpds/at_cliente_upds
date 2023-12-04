import 'dart:developer';
import 'package:at_cliente_upds/data/pregunta_data.dart';
import 'package:at_cliente_upds/db/db_helper.dart';
import 'package:at_cliente_upds/model/categoria.dart';
import 'package:at_cliente_upds/model/respuesta.dart';
import 'package:at_cliente_upds/theme/colors.dart';
import 'package:at_cliente_upds/theme/style_icono.dart';
import 'package:at_cliente_upds/theme/style_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as x;
import 'package:file_saver/file_saver.dart';
import 'package:intl/intl.dart';

class ReporteCategScreen extends StatefulWidget {
  final Categoria categoria;
  const ReporteCategScreen({super.key, required this.categoria});

  @override
  State<ReporteCategScreen> createState() => _ReporteCategScreenState();
}

class _ReporteCategScreenState extends State<ReporteCategScreen> {
  late Future<List<Respuesta>> respuestas;
  late DBHelper dbHelper;
  DateTime fecha = DateTime.now();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refrefreshReportList();
  }

  refrefreshReportList() {
    setState(() {
      respuestas = dbHelper.findAllCatRespuesta(widget.categoria.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).size.height * 0.01;
    String nameFile = "/${widget.categoria.catNombre}_Reporte_$fecha";
    return Scaffold(
      body: FutureBuilder(
        future: respuestas,
        builder:
            (BuildContext context, AsyncSnapshot<List<Respuesta>?> snapshot) {
          final respuestasdb = snapshot.data ?? [];
          return Stack(
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
                    height: MediaQuery.of(context).size.height * .20,
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 50),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              icon: const Icon(Icons.arrow_back),
                              color: negro,
                            ),
                            StyleTextot(
                              colors: updsletras,
                              text: 'Reporte ${widget.categoria.catNombre}',
                              size: 25,
                              fontweight: FontWeight.w700,
                            ),
                            IconButton(
                              onPressed: () async {
                                /*if (await Permission.storage
                                      .request()
                                      .isGranted) {*/
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(22.0))),
                                      contentPadding:
                                          const EdgeInsets.only(top: 10.0),
                                      scrollable: true,
                                      title: Text(
                                          'Datos de ${widget.categoria.catNombre}'),
                                      content: SizedBox(
                                        width: 300.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () async {
                                                final x.Workbook workbook =
                                                    x.Workbook();
                                                final x.Worksheet excel =
                                                    workbook.worksheets
                                                        .addWithName(
                                                            'Respuestas');
                                                /*var i = 0;
                                                final col = [
                                                  'A',
                                                  'B',
                                                  'C',
                                                  'D'
                                                ];*/
                                                Intl.defaultLocale = 'es';
                                                excel.getRangeByName('D1').setText(
                                                    'Fecha: ${DateFormat.yMMMMEEEEd().format(DateTime.now())}');
                                                excel.getRangeByName('B3').setText(
                                                    'REPORTE DE LAS RESPUESTAS');
                                                /*Text(
                                                    '${preguntas.map((e) => excel.getRangeByName('${col[i++]}5').setText(e.pregunta)).toList()}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ));*/
                                                var rows = 6;
                                                rows = 6;
                                                snapshot.data!
                                                    .map((e) => excel
                                                        .getRangeByName(
                                                            'A${rows++}')
                                                        .setText(e.pregunta1))
                                                    .toList();
                                                rows = 6;
                                                snapshot.data!
                                                    .map((e) => excel
                                                        .getRangeByName(
                                                            'B${rows++}')
                                                        .setText(e.pregunta2))
                                                    .toList();
                                                rows = 6;
                                                snapshot.data!
                                                    .map((e) => excel
                                                        .getRangeByName(
                                                            'C${rows++}')
                                                        .setText(e.comentario))
                                                    .toList();
                                                rows = 6;
                                                /*snapshot.data!
                                                    .map((e) => excel
                                                        .getRangeByName(
                                                            'D${rows++}')
                                                        .setText(e.fecha))
                                                    .toList();*/
                                                List<int> sheets =
                                                    workbook.saveAsStream();
                                                workbook.dispose();
                                                //Uint8List data = Uint8List.fromList(sheets);
                                                //MimeType type = MimeType.other;
                                                try {
                                                  String path = await FileSaver
                                                      .instance
                                                      .saveFile(
                                                    name: nameFile,
                                                    bytes: Uint8List.fromList(
                                                        sheets),
                                                    ext: 'xlsx',
                                                    filePath:
                                                        "/storage/emulated/0/Documents",
                                                    mimeType:
                                                        MimeType.microsoftExcel,
                                                  );
                                                  log(path);
                                                } catch (e) {
                                                  print(
                                                      "Error al guardar el archivo: $e");
                                                }
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 20.0, bottom: 20.0),
                                                decoration: const BoxDecoration(
                                                  color: upds,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22.0)),
                                                ),
                                                child: const Text(
                                                  "Exportar",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                                /*} else {
                                    Map<Permission, PermissionStatus> statuses =
                                        await [
                                      Permission.storage,
                                    ].request();*/
                                //  }
                              },
                              icon: const StyleIcono(
                                  iconName: 'export-excel',
                                  color: negro,
                                  ancho: 25,
                                  alto: 25),
                            ),
                          ],
                        ),
                        Center(
                          child: StyleTextot(
                            text: 'Total: ${respuestasdb.length}',
                            colors: updsletras,
                            size: 25.0,
                            fontweight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .20,
                  right: 20.0,
                  left: 20.0,
                ),
                child: respuestasdb.isEmpty
                    ? Center(
                        child: StyleTextot(
                          text: 'No hay respuestas',
                          colors: updsletras,
                          size: 3 * textScale,
                          fontweight: FontWeight.bold,
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: preguntas
                                .map((e) => DataColumn(
                                      label: StyleTextot(
                                          text: e.pregunta, colors: negro),
                                    ))
                                .toList(),
                            rows: snapshot.data!
                                .map((e) => DataRow(cells: [
                                      DataCell(Text(e.pregunta1)),
                                      DataCell(Text(e.pregunta2)),
                                      DataCell(Text(e.comentario!)),
                                    ]))
                                .toList(),
                          ),
                        ),
                      ),
              )
            ],
          );
        },
      ),
    );
  }
}
