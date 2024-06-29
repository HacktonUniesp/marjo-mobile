import 'package:flutter/material.dart';
import 'package:marjosports/src/layers/home/ui/pages/admin_home_page.dart';
import 'package:marjosports/src/layers/login/ui/widgets/registration_form.dart';
import 'package:marjosports/src/theme/theme_app.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'NOME EQUIPE',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RegistrationFormPerson(
                        styleMask: MaskTextInputFormatter(mask: ''),
                        keyboardType: TextInputType.text,
                        labelText: 'Nome',
                        controller: _nomeController,
                      ),
                      const SizedBox(height: 10),
                      RegistrationFormPerson(
                        styleMask: MaskTextInputFormatter(mask: '###.###.###-##'),
                        keyboardType: TextInputType.number,
                        labelText: 'CPF',
                        controller: _cpfController,
                      ),
                      const SizedBox(height: 10),
                      RegistrationFormPerson(
                        styleMask: MaskTextInputFormatter(mask: ''),
                        keyboardType: TextInputType.text,
                        labelText: 'Senha',
                        controller: _senhaController,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeApp.redColor,
                        ),
                        onPressed: () {
                          // if (_formKey.currentState?.validate() ?? false) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(content: Text('Processando dados')),
                          //   );
                          // }
                                                    Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AdminHomePage()),
                              );
                        },
                        child: const Text('Cadastrar', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
