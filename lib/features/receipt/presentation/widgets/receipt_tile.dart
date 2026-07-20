import 'package:flutter/material.dart';

import '../../../../core/database/database.dart';
import '../../../../core/utils/app_formatter.dart';
import '../pages/receipt_detail_page.dart';

class ReceiptTile extends StatelessWidget {
  final Receipt receipt;

  const ReceiptTile({
    super.key,
    required this.receipt,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        child: Icon(Icons.receipt_long),
      ),
      title: Text(receipt.merchant),
      subtitle: Text(
        AppFormatter.date(receipt.receiptDate),
      ),
      trailing: Text(
        AppFormatter.currency(receipt.amount),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ReceiptDetailPage(
              receipt: receipt,
            ),
          ),
        );
      },
    );
  }
}