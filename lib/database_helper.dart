import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StoryDatabaseHelper {
  static const _databaseName = "story_database.db";
  static const _databaseVersion = 1;

  static const table = 'stories';
  static const columnId = 'id';

  StoryDatabaseHelper._privateConstructor();

  static final StoryDatabaseHelper instance =
      StoryDatabaseHelper._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId TEXT PRIMARY KEY
      )
    ''');
  }

  Future<int> insertStory(String id) async {
    final db = await database;
    return await db.insert(table, {columnId: id});
  }

  Future<List<String>> getStories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return maps[i][columnId] as String;
    });
  }

  Future<int> deleteStory(String id) async {
    final db = await database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
