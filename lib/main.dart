import 'package:flutter/material.dart';
import 'lottery_logic.dart'; // Função de gerar números
import 'pdf_utils.dart'; // Função para gerar PDF

class GeneratorPage extends StatefulWidget {
  @override
  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  List<int> generatedNumbers = []; // Lista para armazenar os números gerados
  String selectedLottery =
      'Mega-Sena'; // Loteria selecionada (default: Mega-Sena)

  // Função para gerar os números com base na loteria escolhida
  void generateNumbers() {
    setState(() {
      generatedNumbers = generateLotteryNumbers(selectedLottery);
    });
  }

  // Função para exportar para PDF
  void exportToPdf() {
    if (generatedNumbers.isNotEmpty) {
      generatePdf(generatedNumbers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gerar Jogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown para escolher o tipo de loteria
            DropdownButton<String>(
              value: selectedLottery,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLottery = newValue!;
                });
              },
              items: <String>['Mega-Sena', 'Lotofácil', 'Lotomania', 'Quina']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateNumbers, // Gera números aleatórios
              child: const Text('Gerar Números Aleatórios'),
            ),
            if (generatedNumbers.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Jogos Gerados: ${generatedNumbers.join(', ')}',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ElevatedButton(
              onPressed: exportToPdf, // Exporta os números gerados para PDF
              child: const Text('Exportar para PDF'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loteria App',
      home: GeneratorPage(),
    );
  }
}
