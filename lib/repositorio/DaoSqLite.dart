import 'package:agendaflutter2/entidade/pessoa.dart';
import 'package:agendaflutter2/repositorio/interfaceDao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DaoSqLite implements InterfaceDao {
  Future<Database> initializeDB() async {
    String path = join(await getDatabasesPath(), 'bd.db');
    return await openDatabase(path, onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE pessoas(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email Text, telefone Text)",
      );
    }, version: 1);
  }

  @override
  Future<void> add(Pessoa pessoa) async {
    final Database db = await initializeDB();
    await db.insert('pessoas', pessoa.toMap());
    db.close();
  }

  @override
  Future<int> remove(Pessoa pessoa) async {
    final Database db = await initializeDB();
    return await db.delete("pessoas", where: 'id = ?', whereArgs: [pessoa.id]);
  }

  @override
  Future<List<Pessoa>> get dados async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('pessoas');
    return List.generate(maps.length, (i) {
      return Pessoa.fromMap(maps[i]);
    });
  }
}