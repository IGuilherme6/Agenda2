
import 'package:agendaflutter2/entidade/contato.dart';
import 'package:agendaflutter2/repositorio/DaoSqLite.dart';
import 'package:agendaflutter2/repositorio/interfaceDao.dart';

class ContatoController {
  final InterfaceDao _dao = DaoSqLite();
  List lista = [];
  salvar(Contato c) {
    _dao.add(c);
  }

  remover(Contato c) {
    _dao.remove(c);
  }

  Future<List<Contato>> listar() {
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

  Future<Contato> get(int indice) async {
    lista = await _dao.dados;
    return lista[indice];
  }
}