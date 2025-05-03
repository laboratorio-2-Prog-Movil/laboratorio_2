import 'package:flutter/material.dart';

class TriangleArea extends StatefulWidget {
  const TriangleArea({super.key});

  @override
  State<TriangleArea> createState() => _TriangleAreaState();
}

class _TriangleAreaState extends State<TriangleArea> {
  double _area = 0;
  final _baseController = TextEditingController();
  final _heightController = TextEditingController();

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
                Image.asset("assets/images/logo.png", height: 150, width: 150),
                TextFormField(
                  controller: _baseController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit_note),
                    labelText: "Base del triángulo",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: _heightController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.height),
                    labelText: "Altura del triángulo",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton.icon(
                  onPressed: _calcular,
                  icon: Icon(Icons.calculate),
                  label: Text("Calcular"),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "El área del triángulo es: ${_area.toStringAsFixed(1)} ",
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

  // Función para calcular el área del triángulo
  void _calcular() {
    String baseText = _baseController.text.trim();
    String alturaText = _heightController.text.trim();

    if (baseText.isEmpty || alturaText.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Ningún campo puede estar vacío")));
      return;
    }

    double? base = double.tryParse(baseText);
    double? altura = double.tryParse(alturaText);

    if (base == null || altura == null || base <= 0 || altura <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Base y altura deben ser mayores a cero")),
      );
      return;
    }

    setState(() {
      _area = (base * altura) / 2;
    });
  }
}
