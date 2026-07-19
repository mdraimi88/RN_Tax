import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('Coming Soon'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.backup),
            title: Text('Backup & Restore'),
            subtitle: Text('Coming Soon'),
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