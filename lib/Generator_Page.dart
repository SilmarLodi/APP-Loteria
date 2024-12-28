import 'package:flutter/material.dart';
import 'lottery_logic.dart'; // Função de gerar números
import 'pdf_utils.dart'; // Função para gerar PDF

class GeneratorPage extends StatefulWidget {
  @override
  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  List<int> generatedNumbers = [];
  String selectedLottery = 'Mega-Sena';

  // Função para gerar números
  void generateNumbers() {
    setState(() {
      generatedNumbers = generateLotteryNumbers(selectedLottery);
    });
  }

  // Função para exportar os números gerados para PDF
  void exportToPdf() {
    if (generatedNumbers.isNotEmpty) {
      generatePdf(generatedNumbers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de Jogos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Seletor de loteria
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['Mega-Sena', 'Lotofácil', 'Lotomania', 'Quina']
                  .map((lottery) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedLottery = lottery;
                              generatedNumbers = [];
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedLottery == lottery
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          child: Text(lottery),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateNumbers,
              child: const Text('Gerar Números'),
            ),
            const SizedBox(height: 20),
            if (generatedNumbers.isNotEmpty)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: generatedNumbers
                    .map((number) => Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            number.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: exportToPdf,
              child: const Text('Exportar para PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
