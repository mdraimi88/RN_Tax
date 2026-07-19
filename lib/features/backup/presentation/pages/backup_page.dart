import 'package:flutter/material.dart';

class BackupPage extends StatelessWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backup & Restore'),
      ),
      body: const Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}