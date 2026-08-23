class QuestModel {
  final String id;
  final String title;
  final String time;
  final String status; // 'proses', 'selesai', 'gagal', 'dilewati'
  final int streak;

  QuestModel({
    required this.id,
    required this.title,
    required this.time,
    required this.status,
    required this.streak,
  });
}
