import 'package:examen_2/model/DatosLlamada.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    try {
      return openDatabase(join(await getDatabasesPath(), 'emergencia.db'),
          onCreate: (db, version) {
        return db.execute(""" CREATE TABLE IF NOT EXIST DatosLlamada 
        (id INTENGER PRIMARY KEY AUTOINCREMENT,title TEXT,date TEXT,description TEXT,photopath TEXT )""");
      }, version: 2);
    } catch (e) {
      print('Error al crear la base de datos: $e');
      rethrow;
    }
  }

  static Future<void> insert(DatosLlamada dl) async {
    Database db = await _openDB();
    db.insert('DatosLlamada', dl.toMap());
  }

  static Future<List<DatosLlamada>> DatosLlamadaList() async {
    Database db = await _openDB();
    final List<Map<String, dynamic>> listadocall =
        await db.query('DatosLlamada');

    print(listadocall[9]);

    return List.generate(
        listadocall.length,
        (i) => DatosLlamada(
              id: listadocall[i]['id'],
              date: listadocall[i]['date'],
              title: listadocall[i]['title'],
              description: listadocall[i]['description'],
              photopath: listadocall[i]['photoPath'] ?? '',
            ));
  }
  //print(listadocall);
}
