import 'package:contasfacil/model/login.dart';
import 'package:contasfacil/pages/home/home_page.dart';
import 'package:contasfacil/services/auth.dart';
import 'package:contasfacil/util/business_exception.dart';
import 'package:contasfacil/util/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nmUsuarioController = TextEditingController();
  final TextEditingController _nmSenhaController = TextEditingController();

  login() async {
    try {
      await Auth().login(
        Login(
          nmUsuario: _nmUsuarioController.text,
          nmSenha: _nmSenhaController.text,
        ),
      );

      // ignore: use_build_context_synchronously
      Util.goTo(context, const HomePage());

    } on BusinessException catch (e) {
      Util.showMessage(context, e.mensagem);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nmUsuarioController.dispose();
    _nmSenhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Util.primaryColor,
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                padding: EdgeInsets.all(Util.kDefaultPadding),
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height - 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 10,
                      blurRadius: 70,
                      offset: const Offset(0, 0), // changes position of shadow
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: Util.kDefaultPadding,
                    ),
                    const Text(
                      "Contasfacil",
                      style: TextStyle(
                        fontFamily: "DeliciousHandrawn",
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "O seu aplicativo de controle financeiro",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Nome de Usuário:",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: _nmUsuarioController,
                            style: const TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              hintText: "Informe seu nome de usuário",
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Util.kDefaultPadding,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Senha:",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: _nmSenhaController,
                            obscureText: true,
                            style: const TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              hintText: "Informe seu nome de usuário",
                              hintStyle: const TextStyle(fontSize: 12),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Esqueceu sua senha?",
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Util.kDefaultPadding * 2,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        backgroundColor: const Color.fromRGBO(51, 65, 72, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [Text('ACESSAR')],
                      ),
                    ),
                    const SizedBox(
                      height: Util.kDefaultPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Ainda não possui uma conta?",
                          style: TextStyle(fontSize: 12),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text("Crie sua conta",
                                style: TextStyle(fontSize: 12)))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
