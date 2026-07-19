import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('Coming Soon'),
          ),
          Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.backup),
            title: const Text('Backup & Restore'),
            subtitle: const Text('Backup database and receipts'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.push('/settings/backup');
            },
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.picture_as_pdf),
            title: Text('PDF Export'),
            subtitle: Text('Coming Soon'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('App Version'),
            subtitle: Text('RPTS v1.0.0'),
          ),
        ],
      ),
    );
  }
}