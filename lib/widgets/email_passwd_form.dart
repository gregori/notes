import 'package:flutter/material.dart';
import 'package:notes/widgets/email_form_field.dart';
import 'package:notes/widgets/form_title.dart';
import 'package:notes/widgets/login_button.dart';
import 'package:notes/widgets/password_form_field.dart';
import 'package:notes/widgets/register_button.dart';

class EmailPasswdForm extends StatelessWidget {
  static const loginForm = 'login';
  static const registerForm = 'register';

  const EmailPasswdForm({
    super.key,
    required this.formType,
    required this.onPressed,
    required this.onChangedEmail,
    required this.onChangedPasswd,
  });

  final String formType;
  final VoidCallback onPressed;
  final Function(String?) onChangedEmail;
  final Function(String?) onChangedPasswd;

  @override
  Widget build(BuildContext context) {
    var formTitle = formType == loginForm ? 'Login' : 'Nova Conta';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormTitle(formTitle: 'Notas - $formTitle'),
            const SizedBox(height: 48),
            EmailFormField(onChanged: onChangedEmail),
            const SizedBox(height: 8),
            PasswordFormField(onChanged: onChangedPasswd),
            const SizedBox(height: 24),
            formType == loginForm
                ? LoginButton(onPressed: onPressed)
                : RegisterButton(onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
