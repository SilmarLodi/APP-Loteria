// lib/lottery_logic.dart
import 'dart:math';

// Função para gerar números aleatórios para diferentes loterias
List<int> generateLotteryNumbers(String lotteryType) {
  final random = Random();
  Set<int> numbers = {};

  // Gerar números com base no tipo de loteria
  switch (lotteryType) {
    case 'Mega-Sena':
      while (numbers.length < 6) {
        numbers.add(random.nextInt(60) + 1); // Gera números entre 1 e 60
      }
      break;
    case 'Lotofácil':
      while (numbers.length < 15) {
        numbers.add(random.nextInt(25) + 1); // Gera números entre 1 e 25
      }
      break;
    case 'Lotomania':
      while (numbers.length < 50) {
        numbers.add(random.nextInt(100)); // Gera números entre 0 e 99
      }
      break;
    case 'Quina':
      while (numbers.length < 5) {
        numbers.add(random.nextInt(80) + 1); // Gera números entre 1 e 80
      }
      break;
    default:
      throw Exception('Tipo de loteria inválido');
  }

  return numbers.toList()..sort();
}
