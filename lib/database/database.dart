/*import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studiogenesis/clases/clases.dart';

class PokemonDatabase {
  static final PokemonDatabase instance = PokemonDatabase._init();

  static Database? _database;

  PokemonDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('pokemons.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE pokemons (
  id INTEGER PRIMARY KEY,
  name TEXT,
  height INTEGER,
  weight INTEGER,
  types TEXT,
  imageUrl TEXT
)
''');
  }

  Future<Pokemon> create(Pokemon pokemon) async {
    final db = await instance.database;
    final id = await db.insert('pokemons', pokemon.toMap());
    return pokemon.copy(id: id);
  }

  Future<List<Pokemon>> readAll() async {
    final db = await instance.database;
    final orderBy = 'id DESC';
    final result = await db.query('pokemons', orderBy: orderBy);
    return result.map((json) => Pokemon.fromMap(json)).toList();
  }

  Future<int> update(Pokemon pokemon) async {
    final db = await instance.database;
    return db.update('pokemons', pokemon.toMap(),
        where: 'id = ?', whereArgs: [pokemon.id]);
  }
}
*/