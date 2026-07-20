import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/services/backup_service.dart';
import '../data/services/database_backup_service.dart';
import '../data/services/metadata_service.dart';

final metadataServiceProvider = Provider<MetadataService>((ref) {
  return MetadataService();
});

final databaseBackupServiceProvider = Provider<DatabaseBackupService>((ref) {
  return DatabaseBackupService();
});

final backupServiceProvider = Provider<BackupService>((ref) {
  return BackupService(
    ref.read(metadataServiceProvider),
    ref.read(databaseBackupServiceProvider),
  );
});