import 'package:flutter/material.dart';
import 'dart:math';

class PerimeterCirclePage extends StatefulWidget {
  const PerimeterCirclePage({super.key});

  @override
  State<PerimeterCirclePage> createState() => _PerimeterCirclePageState();
}

class _PerimeterCirclePageState extends State<PerimeterCirclePage> {
  double _perimeter = 0;
  final _radio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        title: const Text("Medidas geométricas"),
      ),
      backgroundColor: Colors.white70,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/logo.png"),
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _radio,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.straighten_rounded),
                        labelText: "Radio del círculo (cm):",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        _calculate();
                      },
                      label: Text("Calcular"),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "El perímetro del circulo es: ${_perimeter.toStringAsFixed(1)} cm",
                      style: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }

  //Funcion para calcular el perímetro del circulo
  void _calculate() {
    String perimeterText = _radio.text.trim();

    //Validamos que se haya ingresado un valor antes de calcular
    if(perimeterText.isEmpty){
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("El valor del radio no puede estar vacío")));
      return;
    }

    //Validamos que el valor ingresado sea positivo
    double radioNew = double.parse(_radio.text);

    if (radioNew < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("El lado de una figura geométrica no es negativo"),
        ),
      );
    } else {  //Calculamos el perímetro
      setState(() {
        _perimeter = pi * 2 * radioNew;
      });
    }
  }
}
