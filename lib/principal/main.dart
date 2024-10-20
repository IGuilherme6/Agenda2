import 'package:agendaflutter2/controle/contatocontroller.dart';
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
  ContatoController controller = new ContatoController();
  @override
  Widget build(BuildContext context) {
    MaterialApp(
      initialRoute: "login",
      routes: {
        'login': (context) => Login(),
        '/listagem': (context) => Listagem(controller: controller),
        '/cadastro': (context) => Cadastro(controller: controller),
      },
    );
  }

}