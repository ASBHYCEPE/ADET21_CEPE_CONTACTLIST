import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = 'Contacts.db';
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._init();

  DatabaseHelper._init();

  Future<Database> _initDB(String dbName) async {
    final dbFilePath = await getDatabasesPath();
    final path = join(dbFilePath, dbName);

    return await openDatabase(path, version: _version);
  }
}
