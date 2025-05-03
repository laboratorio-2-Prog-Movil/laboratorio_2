import 'package:flutter/material.dart';

class SquarePerimeter extends StatefulWidget {
  const SquarePerimeter({super.key});

  @override
  State<SquarePerimeter> createState() => _SquarePerimeterState();
}

class _SquarePerimeterState extends State<SquarePerimeter> {
  double _perimeter = 0;
  final _squareSideController = TextEditingController();

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
                const Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 150,
                  width: 150,
                ),
                TextFormField(
                  controller: _squareSideController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit_note),
                    labelText: "Lado del cuadrado",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton.icon(
                  onPressed: _calcularPerimetro,
                  icon: const Icon(Icons.calculate),
                  label: const Text("Calcular"),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "El perímetro del cuadrado es: ${_perimeter.toStringAsFixed(1)}",
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

  void _calcularPerimetro() {
    String input = _squareSideController.text.trim();

    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("El lado no puede estar vacío")),
      );
      return;
    }

    double side = double.tryParse(input) ?? -1;

    if (side < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("El lado de una figura geométrica no puede ser negativo")),
      );
      return;
    }

    setState(() {
      _perimeter = 4 * side;
    });
  }
}
