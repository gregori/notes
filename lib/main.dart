import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/main_screen.dart';
import 'package:notes/screens/register_screen.dart';
import 'package:notes/screens/welcome_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return const MaterialApp(
            home: Center(
              child: Text('Não foi possível inicializar o Firebase'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context) => const WelcomeScreen(),
              '/register': (context) => const RegisterScreen(),
              '/main': (context) => const MainScreen(),
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
