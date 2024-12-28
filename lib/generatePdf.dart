import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

// Função para gerar PDF com os números da Mega-Sena
Future<void> generatePdf(List<int> numbers) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text(
            'Jogos Gerados: ${numbers.join(', ')}',
            style: pw.TextStyle(fontSize: 24),
          ),
        );
      },
    ),
  );

  // Salva e exibe o PDF (para impressão ou visualização)
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
