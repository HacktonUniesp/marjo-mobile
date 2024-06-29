import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marjosports/src/layers/login/ui/pages/login_page.dart';
import 'package:marjosports/src/layers/login/ui/pages/register_page.dart';


void main() {
  testWidgets('Login Page has all necessary widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verifica se existe o campo de entrada CPF
    expect(find.widgetWithText(TextFormField, 'CPF'), findsOneWidget);

    // Verifica se existe o campo de entrada Senha
    expect(find.widgetWithText(TextFormField, 'Senha'), findsOneWidget);

    // Verifica se existe o botão 'Entrar'
    expect(find.text('Entrar'), findsOneWidget);

    // Verifica se existe o botão 'Cadastrar'
    expect(find.text('Cadastrar'), findsOneWidget);
  });

  testWidgets('Login Page navigation to Register Page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Toca no botão 'Cadastrar'
    await tester.tap(find.text('Cadastrar'));
    await tester.pumpAndSettle();

    // Verifica se a RegisterPage foi aberta
    expect(find.byType(RegisterPage), findsOneWidget);
  });
}