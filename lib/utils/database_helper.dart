import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:nxsam_bg/Models/ProjectData.dart';

class DatabaseHelper
{
  static late final DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database? _database;                // Singleton Database

  String ProjectTable = 'project_table';
  String colProId = 'project_id';
  String colProName = 'project_name';
  String colClientId = 'client_id';


  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database?> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'ProjectData.db';

    // Open/create the database at a given path
    var ProjectDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return ProjectDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $ProjectTable($colProId INTEGER PRIMARY KEY, $colProName TEXT, '
        '$colClientId INTEGER)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getClientProject(int id) async {
    Database? db = await this.database;

		var result = await db!.rawQuery('SELECT * FROM $ProjectTable WHERE $colClientId = $id');
    return result;
  }

  // Get number of Project objects in database
  Future<int?> getCount(int id) async {
    Database? db = await this.database;
    List<Map<String, dynamic>> x = await db!.rawQuery('SELECT COUNT (*) from $ProjectTable WHERE $colClientId = $id');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }
}
