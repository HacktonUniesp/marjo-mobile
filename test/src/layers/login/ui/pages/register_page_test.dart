import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marjosports/src/layers/login/ui/pages/register_page.dart';

void main() {
  testWidgets('Register Page has all necessary widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterPage()));

    // Verifica se existe o texto 'NOME EQUIPE'
    expect(find.text('NOME EQUIPE'), findsOneWidget);

    // Verifica se existe o campo de entrada Nome
    expect(find.widgetWithText(TextFormField, 'Nome'), findsOneWidget);

    // Verifica se existe o campo de entrada CPF
    expect(find.widgetWithText(TextFormField, 'CPF'), findsOneWidget);

    // Verifica se existe o campo de entrada Senha
    expect(find.widgetWithText(TextFormField, 'Senha'), findsOneWidget);

    // Verifica se existe o botão 'Cadastrar'
    expect(find.text('Cadastrar'), findsOneWidget);
  });
}