import 'package:sqflite/sqflite.dart';
import 'package:contact_list/models/contacts.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = 'Contacts.db';
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._init();

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(_dbName);

    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbFilePath = await getDatabasesPath();
    final path = join(dbFilePath, dbName);

    return await openDatabase(path, version: _version, onCreate: _createDB);
  }

  Future _createDB(Database db, int vesrion) async {
    const String sql = '''CREATE TABLE contacts 
        (id INTEGER PRIMARY KEY, 
        firstName VARCHAR(255) NOT NULL, 
        lastName VARCHAR(255) NOT NULL, 
        contactNumber VARCHAR(25) NOT NULL,
        address VARCHAR(255), 
        email VARCHAR(255));''';

    return await db.execute(sql);
  }

  Future<List<Contact>?> getAllContacts() async {
    final db = await database;

    final List<Map<String, dynamic>> data =
        await db.query('contacts', orderBy: 'firstName ASC');

    if (data.isEmpty) {
      return null;
    }

    return List.generate(data.length, (index) => Contact.fromJson(data[index]));
  }

  Future<int> addContact(Contact contact) async {
    final db = await database;

    return await db.insert('contacts', contact.toJson());
  }

  Future<int> updateContact(Contact contact) async {
    final db = await database;
    return await db.update('contacts', contact.toJson(),
        where: 'id = ?',
        whereArgs: [contact.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> deleteContact(Contact contact) async {
    final db = await database;

    return db.delete('contacts', where: 'id = ?', whereArgs: [contact.id]);
  }
}
