import 'package:agendaflutter2/controle/pessoaController.dart';
import 'package:agendaflutter2/principal/cadastro.dart';
import 'package:agendaflutter2/principal/listagem.dart';
import 'package:agendaflutter2/principal/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<StatefulWidget> createState() {
    return _App();
  }

}

class _App extends State<App> {
  Pessoacontroller controller = new Pessoacontroller();

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      initialRoute: "/listagem",
      routes: {
        //'/login': (context) => Login(),
        '/listagem': (context) => Listagem(pessoaController: controller),
        '/cadastro': (context) => Cadastro(pessoaController: controller),
      },
    );
  }

}