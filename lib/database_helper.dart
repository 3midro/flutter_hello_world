import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 6;

  static final tableDatos = 'table_datos';
  static final tableDeportes = 'table_deportes';
  static final tableOpciones = 'table_opciones';
  static final tableRegistro = 'table_registro';
  static final tableTexto = 'table_texto';
  
  //table_datos
  static final columnId = '_id';
  static final columnNombre = 'nombre';
  static final columnApellido = 'apellido';

  //table_deportes
  static final columnIdDeporte = '_idDep';
  static final columnDeporte = 'deporte';
  static final columnEdad = 'edad';

  //table_opciones
  static final columnIdopc = '_idOpc';
  static final columnTransporte = 'transporte';
  static final columnColor = 'color';
  static final columnTam = 'tamanio';

  //table_registro
  static final columnIdreg = '_idReg';
  static final columnName = 'name';
  static final columnTel = 'tel';
  static final columnEmail = 'email';
  static final columnPass = 'pass';
  static final columnPassrep = 'passRep';
  static final columnGen = 'genero';

  //table_texto
  static final columnIdTxt = '_idAlgo';
  static final columnTxt = 'texto';


  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }
  
  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableDatos (
            $columnId INTEGER PRIMARY KEY,
            $columnNombre TEXT NOT NULL,
            $columnApellido INTEGER NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $tableDeportes (
            $columnIdDeporte INTEGER PRIMARY KEY,
            $columnDeporte TEXT NOT NULL,
            $columnEdad INTEGER NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $tableOpciones (
            $columnIdopc INTEGER PRIMARY KEY,
            $columnTransporte TEXT NOT NULL,
            $columnColor TEXT NOT NULL,
            $columnTam TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $tableRegistro (
            $columnIdreg INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnTel INTEGER NOT NULL,
            $columnGen TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPass TEXT NOT NULL,
            $columnPassrep TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $tableTexto (
            $columnIdTxt INTEGER PRIMARY KEY,
            $columnTxt TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is 
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount(String table) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other 
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(tableDatos, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is 
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(String table,int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteDeporte(String table,int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnIdDeporte = ?', whereArgs: [id]);
  }

  Future<int> deleteOpciones(String table,int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnIdopc = ?', whereArgs: [id]);
  }

  Future<int> deleteRegistro(String table,int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnIdreg = ?', whereArgs: [id]);
  }

  Future<int> deleteTexto(String table,int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnIdTxt = ?', whereArgs: [id]);
  }
}