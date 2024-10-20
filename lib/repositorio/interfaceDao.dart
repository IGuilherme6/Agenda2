import 'package:agendaflutter2/entidade/contato.dart';

abstract class InterfaceDao {

  Future<void> add(Contato c);
  Future<int> remove(Contato c);
  Future<List<Contato>> get dados;
}
