import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/widgets/email_passwd_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;
  final auth = FirebaseAuth.instance;

  void signUp() {
    auth
        .createUserWithEmailAndPassword(email: email!, password: password!)
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
      formType: EmailPasswdForm.registerForm,
      onPressed: signUp,
      onChangedEmail: onChangedEmail,
      onChangedPasswd: onChangedPassword,
    );
  }
}
