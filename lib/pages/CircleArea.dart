import 'package:flutter/material.dart';
import 'dart:math';


class CircleArea extends StatefulWidget {
  const CircleArea({super.key});

  @override
  State<CircleArea> createState() => _CircleArea();
}

class _CircleArea extends State<CircleArea> {
  double _area = 0;
  final _circleRadius = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Medidas geométricas"),
      ),
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 150,
                  width: 150,
                ),
                TextFormField(
                  controller: _circleRadius,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit_note),
                    labelText: "Radio del círculo",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton.icon(
                  onPressed: () {
                    _calcular();
                  },
                  label: Text("Calcular"),
                ),
                const SizedBox(height: 20.0),

                Text(
                  "El área del circulo es: ${_area.toStringAsFixed(1)} ",
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //The following function calculate the area for a circle
  void _calcular() {
    
    String areaText =_circleRadius.text.trim();

    if (areaText.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("El radio no puede estar vacío")));
      return;
    }

    //Se valida el lado, puesto que una distancia no es negativa

    double radius = double.parse(_circleRadius.text);

    if (radius < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("El radio de un circulo no es negativo"),
        ),
      );
    } else {
      setState(() {
        _area = pi*radius*radius;
      });
    }
  }
}
