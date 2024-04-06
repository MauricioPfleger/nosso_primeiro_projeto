import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';
import 'package:nosso_primeiro_projeto/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              background: Colors.white, seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const FormScreen());
  }
}
