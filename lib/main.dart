import 'package:flutter/material.dart';
import 'package:laboratorio_2/pages/SquareArea.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geometría',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Squarearea(),
    );
  }
}
// se creo el branch develop. Sobre esta se desarrollará el proyecto