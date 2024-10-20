import 'package:agendaflutter2/entidade/contato.dart';
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
  Future<void> add(Contato c) async {
    final Database db = await initializeDB();
    await db.insert('pessoas', c.toMap());
    db.close();
  }

  @override
  Future<int> remove(Contato c) async {
    final Database db = await initializeDB();
    return await db.delete("pessoas", where: 'id = ?', whereArgs: [c.id]);
  }

  @override
  Future<List<Contato>> get dados async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('pessoas');
    return List.generate(maps.length, (i) {
      return Contato.fromMap(maps[i]);
    });
  }
}
