import 'package:agendaflutter2/entidade/contato.dart';
import 'package:agendaflutter2/repositorio/interfaceDao.dart';

class Dao implements InterfaceDao {
  final List<Contato> _dados = [];
  @override
  Future<void> add(Contato contato) async {
    _dados.add(contato);
  }

  @override
  Future<List<Contato>> get dados async => _dados;

  @override
  Future<int> remove(Contato pessoa) {
    int index = _dados.indexOf(pessoa);
    if (index != -1) {
      _dados.removeAt(index);
    }
    return Future.value(index);
  }
}
