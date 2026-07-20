import '../../domain/models/backup_info.dart';
import 'database_backup_service.dart';
import 'metadata_service.dart';

class BackupService {
  final MetadataService _metadataService;
  final DatabaseBackupService _databaseBackupService;

  BackupService(
      this._metadataService,
      this._databaseBackupService,
      );

  Future<BackupInfo> getBackupInfo() {
    return _metadataService.loadBackupInfo();
  }

  Future<void> prepareBackup() async {
    await _databaseBackupService.getDatabaseFile();
  }
}