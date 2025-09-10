enum TaskStatus { belumDiambil, onProgress, selesai, dibatalkan }

class TaskModel {
  final String title;
  final String description;
  final DateTime tanggal;
  final DateTime deadline;
  final String tipe;
  final String pemberiTugas;
  final TaskStatus status;
  final bool isMyTask;
  final bool isCreatedByMe;

  // Tambahan
  final DateTime? tanggalProgress;
  final DateTime? tanggalSelesai;
  final DateTime? tanggalBatal;
  final int leadTime; // dalam hari
  final String? catatan;

  TaskModel({
    required this.title,
    required this.description,
    required this.tanggal,
    required this.deadline,
    required this.tipe,
    required this.pemberiTugas,
    required this.status,
    required this.isMyTask,
    required this.isCreatedByMe,
    this.tanggalProgress,
    this.tanggalSelesai,
    this.tanggalBatal,
    this.catatan,
  }) : leadTime = deadline.difference(tanggal).inDays;
}
