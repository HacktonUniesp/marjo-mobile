import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:marjosports/src/layers/home/ui/pages/admin_home_page.dart';
import 'package:marjosports/src/layers/home/ui/pages/user_home_page.dart';
import 'package:marjosports/src/layers/login/ui/widgets/registration_form.dart';
import 'package:marjosports/src/theme/theme_app.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;

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
  final _emailController = TextEditingController();
  String drop = 'ADMIN';

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    _senhaController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    final url = Uri.parse('http://10.0.7.247:8080/customer');
    final response = await http.post(

      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': _nomeController.text,
        'email': _emailController.text,
        'cpf': _cpfController.text,
        'userType': drop,
        'loginName': _nomeController.text,
        'password': _senhaController.text,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminHomePage()),
      );
    }  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/impacto.png', width: 150,),
                  const SizedBox(height: 20),
                  RegistrationFormPerson(
                    styleMask: MaskTextInputFormatter(mask: ''),
                    keyboardType: TextInputType.text,
                    labelText: 'Nome',
                    controller: _nomeController,
                  ),
                  const SizedBox(height: 10),
                  RegistrationFormPerson(
                    styleMask: MaskTextInputFormatter(mask: ''),
                    keyboardType: TextInputType.text,
                    labelText: 'Email',
                    controller: _emailController,
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
                  Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      focusColor: Colors.white,
                      value: drop,
                      items: const [
                        DropdownMenuItem(
                          value: 'ADMIN',
                          child: Text('ADMIN'),
                        ),
                        DropdownMenuItem(
                          value: 'CLIENT',
                          child: Text('CLIENT'),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          drop = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeApp.redColor,
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _registerUser();
                       Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserHomePage()),
                            );
                      }
                    },
                    child: const Text('Cadastrar', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
