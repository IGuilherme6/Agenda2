import 'package:agendaflutter2/entidade/pessoa.dart';

abstract class InterfaceDao {

  Future<void> add(Pessoa p);
  Future<int> remove(Pessoa p);
  Future<List<Pessoa>> get dados;
}
