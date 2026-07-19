import '../../domain/models/backup_info.dart';
import 'metadata_service.dart';

class BackupService {
  final MetadataService _metadataService;

  BackupService(this._metadataService);

  Future<BackupInfo> getBackupInfo() {
    return _metadataService.loadBackupInfo();
  }
}