import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/services/backup_service.dart';
import '../data/services/metadata_service.dart';

final metadataServiceProvider = Provider<MetadataService>((ref) {
  return MetadataService();
});

final backupServiceProvider = Provider<BackupService>((ref) {
  return BackupService(
    ref.read(metadataServiceProvider),
  );
});