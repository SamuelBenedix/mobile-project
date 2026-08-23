import '../../models/quest_model.dart';

class MockData {
  static List<QuestModel> getDailyQuests() {
    return [
      QuestModel(
        id: '1',
        title: 'Bangun Pagi',
        time: '7:00 AM',
        status: 'proses',
        streak: 12,
      ),
      QuestModel(
        id: '2',
        title: 'Bangun Pagi',
        time: '',
        status: 'selesai',
        streak: 12,
      ),
      QuestModel(
        id: '3',
        title: 'Bangun Pagi',
        time: '',
        status: 'gagal',
        streak: 0,
      ),
      QuestModel(
        id: '4',
        title: 'Bangun Pagi',
        time: '',
        status: 'dilewati',
        streak: 12,
      ),
    ];
  }
}
