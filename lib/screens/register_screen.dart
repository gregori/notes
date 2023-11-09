import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/utils/constants.dart';
import 'package:notes/widgets/rounded_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email;
  late String password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Notas - Nova Conta',
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 48),
            TextField(
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Entre seu email',
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Entre sua senha',
              ),
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(height: 24),
            RoundedButton(
                title: 'Registrar-se',
                color: Colors.green,
                onPressed: () {
                  auth
                      .createUserWithEmailAndPassword(
                          email: email, password: password)
                      .then((value) => Navigator.pushNamed(context, '/main'));
                }),
          ],
        ),
      ),
    );
  }
}
