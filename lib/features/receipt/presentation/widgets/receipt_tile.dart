import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database.dart';
import '../../../../core/utils/app_formatter.dart';
import '../../providers/receipt_notifier.dart';
import '../pages/receipt_detail_page.dart';
import 'delete_receipt_dialog.dart';

class ReceiptTile extends ConsumerWidget {
  final Receipt receipt;

  const ReceiptTile({
    super.key,
    required this.receipt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(receipt.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.red.shade600,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (_) async {
        return await showDeleteReceiptDialog(
          context,
          merchant: receipt.merchant,
        );
      },
      onDismissed: (_) async {
        try {
          await ref
              .read(receiptNotifierProvider.notifier)
              .deleteReceipt(receipt.id);

          if (!context.mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '"${receipt.merchant}" berjaya dipadam.',
              ),
            ),
          );
        } catch (e) {
          if (!context.mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ralat: $e'),
            ),
          );
        }
      },
      child: ListTile(
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
      ),
    );
  }
}