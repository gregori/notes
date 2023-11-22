import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/widgets/email_passwd_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  final auth = FirebaseAuth.instance;

  void signIn() {
    auth
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) => Navigator.pushNamed(context, '/main'));
  }

  void onChangedEmail(String? value) {
    email = value;
  }

  void onChangedPassword(String? value) {
    password = value;
  }

  @override
  Widget build(BuildContext context) {
    return EmailPasswdForm(
      formType: EmailPasswdForm.loginForm,
      onPressed: signIn,
      onChangedEmail: onChangedEmail,
      onChangedPasswd: onChangedPassword,
    );
  }
}
