import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:learning_flutter_app/todo/models/todo.dart';

class DbHelper {
  // Singleton
  static final DbHelper _dbHelper = DbHelper._internal();

  String tblTodo = "todo";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static late Database _db;

  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}todos.db";
    var dbToDos = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbToDos;
  }

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $tblTodo ($colId INTEGER PRIMARY KEY, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)"
    );
  }

  Future<int> insertToDo(ToDo todo) async {
    Database db = await this.db;
    var result = await db.insert(tblTodo, todo.toMap());
    return result;
  }

  Future<List> getToDos() async {
    Database db = await this.db;
    var result = await db.rawQuery("SELECT * FROM $tblTodo order by $colPriority ASC");
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
      await db.rawQuery("select count (*) from $tblTodo")
    ) ?? 0;
    return result;
  }

  Future<int> updateToDo(ToDo todo) async {
    var db = await this.db;
    var result = await db.update(tblTodo, todo.toMap(), where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteToDo(int id) async {
    int result;
    var db = await this.db;
    result = await db.rawDelete("DELETE FROM $tblTodo WHERE $colId = $id");
    return result;
  }
}
