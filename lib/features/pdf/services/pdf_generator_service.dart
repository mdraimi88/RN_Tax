import 'package:pdf/widgets.dart' as pw;

import '../domain/models/tax_report.dart';

class PdfGeneratorService {
  const PdfGeneratorService();

  Future<pw.Document> generate({
    required TaxReport report,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Text(
              'RPTS (Raimi-Nora Personal Tax System)',
              style: pw.TextStyle(
                fontSize: 22,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),

          pw.SizedBox(height: 20),

          pw.Text(
            'Assessment Year: ${report.assessmentYear}',
            style: const pw.TextStyle(fontSize: 16),
          ),

          pw.SizedBox(height: 20),

          pw.Text(
            'Tax Relief Summary',
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
            ),
          ),

          pw.SizedBox(height: 10),

          pw.Table(
            border: pw.TableBorder.all(),
            children: [
              _row('Total Spent', report.totalSpent),
              _row('Eligible Relief', report.totalEligibleRelief),
              _row('Remaining Relief', report.remainingRelief),
              _row('Maximum Relief', report.maximumRelief),
            ],
          ),
        ],
      ),
    );

    return pdf;
  }

  pw.TableRow _row(String title, double value) {
    return pw.TableRow(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(title),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(
            'RM ${value.toStringAsFixed(2)}',
            textAlign: pw.TextAlign.right,
          ),
        ),
      ],
    );
  }
}