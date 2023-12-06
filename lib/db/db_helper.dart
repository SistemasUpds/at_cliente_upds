import 'package:at_cliente_upds/model/respuesta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DBHelper {
  static const dbname = 'dbCliente.db';
  static const respuestasTable = 'Respuesta';
  static const respuestasId = 'id';

  static Database? _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, dbname);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $respuestasTable(
      $respuestasId INTEGER PRIMARY KEY,
      pregunta1 TEXT,
      pregunta2 TEXT,
      comentario TEXT NOT NULL,
      idCategoira INTEGER,
      fecha TEXT,
      ci TEXT
    )''');
  }

  Future<Respuesta> addRespuesta(Respuesta respuesta) async {
    var dbClient = await db;
    respuesta.id = await dbClient.insert(respuestasTable, respuesta.toMap());
    return respuesta;
  }

  Future<List<Respuesta>> getAllRespuesta() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> maps =
        await dbClient.query(respuestasTable);

    return List.generate(maps.length, (index) {
      return Respuesta(
        id: maps[index]['id'],
        pregunta1: maps[index]['pregunta1'],
        pregunta2: maps[index]['pregunta2'],
        comentario: maps[index]['comentario'],
        idCategoira: maps[index]['idCategoira'],
        fecha: maps[index]['fecha'],
        ci: maps[index]['ci'],
      );
    });
  }

  Future<List<Respuesta>> findAllCatRespuesta(int categoriaId) async {
    var dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient
        .query(respuestasTable, where: 'idCategoira = $categoriaId');

    return List.generate(maps.length, (index) {
      return Respuesta(
          id: maps[index]['id'],
          pregunta1: maps[index]['pregunta1'],
          pregunta2: maps[index]['pregunta2'],
          comentario: maps[index]['comentario'],
          idCategoira: maps[index]['idCategoira'],
          fecha: maps[index]['fecha'],
          ci: maps[index]['ci']);
    });
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
