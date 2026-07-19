import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../domain/models/pdf_report.dart';

class PdfGenerator {
  Future<Uint8List> generateReport(PdfReport report) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Text(
              'RPTS Tax Report',
              style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),

          pw.SizedBox(height: 20),

          _buildRow(
            'Assessment Year',
            report.assessmentYear.toString(),
          ),

          _buildRow(
            'Generated',
            DateFormat('dd MMM yyyy HH:mm').format(report.generatedAt),
          ),

          pw.Divider(),

          _buildRow(
            'Total Receipts',
            report.totalReceipts.toString(),
          ),

          _buildRow(
            'Total Spending',
            'RM ${report.totalAmount.toStringAsFixed(2)}',
          ),

          _buildRow(
            'Eligible Tax Relief',
            'RM ${report.totalTaxRelief.toStringAsFixed(2)}',
          ),

          _buildRow(
            'Top Category',
            report.topCategory,
          ),
        ],
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildRow(String title, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 6),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(title),
          pw.Text(
            value,
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}