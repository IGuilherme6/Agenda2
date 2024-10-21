
import 'package:agendaflutter2/entidade/pessoa.dart';
import 'package:agendaflutter2/repositorio/DaoSqLite.dart';
import 'package:agendaflutter2/repositorio/interfaceDao.dart';

class Pessoacontroller {
  final InterfaceDao _dao = DaoSqLite();
  List lista = [];
  salvar(Pessoa p) {
    _dao.add(p);
  }

  remover(Pessoa p) {
    _dao.remove(p);
  }

  Future<List<Pessoa>> listar() {
    return _dao.dados;
  }

  Future<int> size() async {
    lista = await _dao.dados;
    return lista.length;
  }

  info(int indice) async {
    lista = await _dao.dados;
    return _dao.dados;
  }

  Future<Pessoa> get(int indice) async {
    lista = await _dao.dados;
    return lista[indice];
  }
}