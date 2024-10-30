import 'package:flutter/material.dart';
import 'package:meu_app/services/authentication_service.dart';
import 'package:meu_app/widgets/snack_bar_widget.dart';
import 'package:meu_app/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  AuthenticationService _authService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsetsDirectional.all(10),
          child: Column(
            children: [
              // Image.asset("assets/tasks.png", width: 200, height: 200),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        decoration: decoration("E-mail"),
                        validator: (value) =>
                            requiredValidator(value, "o email"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _senhaController,
                        decoration: decoration("Senha"),
                        validator: (value) =>
                            requiredValidator(value, "a senha"),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              String email = _emailController.text;
                              String senha = _senhaController.text;
                              _authService
                                  .loginUser(email: email, password: senha)
                                  .then((error) {
                                if (error != null) {
                                  snackBarWidget(
                                      context: context,
                                      title: error,
                                      isError: true);
                                }
                              });
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Entrar'),
                            ],
                          )),
                      TextButton(
                        child: const Text("Ainda não tem conta? Registre-se"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/loginRegister");
                        },
                      )
                    ],
                  ))
            ],
          ),
        )));
  }
}
