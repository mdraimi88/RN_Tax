import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/services/pdf_generator.dart';

final pdfGeneratorProvider = Provider<PdfGenerator>((ref) {
  return PdfGenerator();
});