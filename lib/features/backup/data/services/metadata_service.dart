import '../../domain/models/backup_info.dart';

class MetadataService {
  Future<BackupInfo> loadBackupInfo() async {
    return const BackupInfo(
      appVersion: 'RPTS v1.0.0',
      databaseVersion: 3,
      lastBackup: null,
      receiptCount: 0,
      databaseHealthy: true,
    );
  }
}