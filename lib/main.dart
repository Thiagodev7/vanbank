import 'package:flutter/material.dart';
import 'package:vanbank/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      home: Home(), // Define a tela Home como a tela inicial
    );
  }
}
