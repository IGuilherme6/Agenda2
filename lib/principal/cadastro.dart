import 'package:agendaflutter2/controle/pessoaController.dart';
import 'package:agendaflutter2/entidade/pessoa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';


class Cadastro extends StatelessWidget {
  final Pessoacontroller pessoaController;

  const Cadastro(
      {super.key,
        required this.pessoaController}); // Recebe o controlador como argumento
// Função para validar o email
  bool _isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
      r'^[^@]+@[^@]+\.[^@]+',
    );
    return emailRegex.hasMatch(email);
  }

  // Função para validar o telefone
  bool _isTelefoneValid(String phone) {
    final RegExp phoneRegex = RegExp(r'^\(\d{2}\) \d{4,5}-\d{4}$');
    return phoneRegex.hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    MaskedTextController telefoneController = MaskedTextController(mask: '(00) 00000-0000');
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Pessoas')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Entre com o nome'),
            controller: nomeController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Entre com o email'),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Entre com o Telefone'),
            controller: telefoneController,
            keyboardType: TextInputType.phone,
          ),
          ElevatedButton(
              onPressed: () {
                // Validação do e-mail
                if (!_isEmailValid(emailController.text)) {
                  // Exibe um alerta se o email for inválido
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor, insira um e-mail válido.')),
                  );
                  return; // Sai da função se o e-mail não for válido
                }
                if (!_isTelefoneValid(telefoneController.text)) {
                  // Exibe um alerta se o telefone for inválido
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor, insira um telefone válido.')),
                  );
                  return; // Sai da função se o e-mail não for válido
                }

                // Criação da nova pessoa
                Pessoa novaPessoa = Pessoa(
                  nome: nomeController.text,
                  email: emailController.text,
                  telefone: telefoneController.text,
                );

                // Adiciona a nova pessoa ao controlador
                pessoaController.salvar(novaPessoa);

                Navigator.pop(context);
              },
              child: const Text('Salvar'))
        ],
      ),
    );
  }
}