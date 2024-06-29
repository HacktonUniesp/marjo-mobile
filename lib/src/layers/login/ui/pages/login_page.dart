import 'package:flutter/material.dart';
import 'package:marjosports/src/layers/login/ui/widgets/registration_button.dart';
import 'package:marjosports/src/layers/login/ui/widgets/registration_form.dart';
import 'package:marjosports/src/theme/theme_app.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formKey = GlobalKey<FormState>();
final _nomeController = TextEditingController();
final _cpfController = TextEditingController();
final _senhaController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RegistrationButton(label: 'Entrar', labelColor: Colors.black, backgroundColor: Colors.white,),
                        SizedBox(width: 20),
                        RegistrationButton(label: 'Cadastrar', labelColor: Colors.white, backgroundColor: ThemeApp.redColor,),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    _senhaController.dispose();
    super.dispose();
  }
}
