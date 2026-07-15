import 'package:flutter/material.dart';

class AddReceiptPage extends StatelessWidget {
  const AddReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Resit'), centerTitle: true),
      body: const Center(
        child: Text('Add Receipt Screen', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
