import 'package:flutter/material.dart';
import 'CircleArea.dart';
import 'perimeter_circle_page.dart';
import 'SquareArea.dart';
import 'perimeter_square.dart';
import 'triangle_area.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _seleccion;
// Mapa con cada una de las páginas necesarias para la implementación.
  final Map<String, Widget> _paginas = {
    'Área del círculo': const CircleArea(),
    'Perímetro del círculo': const PerimeterCirclePage(),
    'Área del cuadrado': const Squarearea(),
    'Perímetro del cuadrado': const SquarePerimeter(),
    'Área del triángulo': const TriangleArea(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora geométrica'),
      backgroundColor:Theme.of(context).colorScheme.primary),
      backgroundColor: Colors.white70,
        body: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/logo.png"),
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '¿Qué desea calcular?',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    value: _seleccion,
                    hint: const Text('Seleccione una opción'),
                    items: _paginas.keys.map((String nombre) {
                      return DropdownMenuItem<String>(
                        value: nombre,
                        child: Text(nombre),
                      );
                    }).toList(),
                    onChanged: (valor) {
                      setState(() {
                        _seleccion = valor;
                      });
                      if (valor != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _paginas[valor]!,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
