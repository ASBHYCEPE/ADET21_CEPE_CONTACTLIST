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

    return await openDatabase(path, version: _version, onCreate: _createDB);
  }

  Future _createDB(Database db, int Vesrion) async {
    const String sql = '''CREATE TABLE contacts 
        (id INTEGER PRIMARY KEY, firstName 
        VARCHAR(255) NOT NULL, 
        lastName VARCHAR(255) NOT NULL, 
        contactNumber VARCHAR(25) NOT NULL, 
        email VARCHAR(255))''';

    return await db.execute(sql);
  }
}
