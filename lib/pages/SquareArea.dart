import 'package:flutter/material.dart';

class Squarearea extends StatefulWidget {
  const Squarearea({super.key});

  @override
  State<Squarearea> createState() => _SquareareaState();
}

class _SquareareaState extends State<Squarearea> {
  double _area = 0;
  final _square_side = TextEditingController();

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
                  controller: _square_side,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit_note),
                    labelText: "Lado del cuadrado",
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
                  "El área del cuadrado es: ${_area.toStringAsFixed(1)} ",
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

  //The following function calculate the area for a square
  void _calcular() {
    //Con el objetivo de mejorar la iteracción y ejecución de la aplicación, se procede con validaciones de datos.

    //Se valida que ninguno de los campos este sin llenar
    String areaText = _square_side.text.trim();

    if (areaText.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("El lado no puede esta vacío")));
      return;
    }

    //Se valida el lado, puesto que una distancia no es negativa

    double _Side = double.parse(_square_side.text);

    if (_Side < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("El lado de una figura geométrica no es negativo"),
        ),
      );
    } else {
      setState(() {
        _area = _Side * _Side;
      });
    }
  }
}
