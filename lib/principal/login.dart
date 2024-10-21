import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var usuarioController = TextEditingController();
    var senhaController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Entre com o login"),
            controller: usuarioController,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: "Entre com a senha"),
            controller: senhaController,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.login),
              label: Text('Entrar'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_circle_outline_sharp),
              label: Text('Cadastar'),
            )
          ])
        ],
      ),
    );
  }
}
