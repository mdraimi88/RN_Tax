class BackupInfo {
  final String appVersion;
  final int databaseVersion;
  final DateTime? lastBackup;
  final int receiptCount;
  final bool databaseHealthy;

  const BackupInfo({
    required this.appVersion,
    required this.databaseVersion,
    required this.lastBackup,
    required this.receiptCount,
    required this.databaseHealthy,
  });
}