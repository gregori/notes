import 'package:flutter/material.dart';
import 'package:notes/widgets/rounded_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Notas',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedButton(
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              color: Colors.blueAccent,
            ),
            RoundedButton(
              title: 'Registrar-se',
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
