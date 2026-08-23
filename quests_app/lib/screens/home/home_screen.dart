import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/date_selector.dart';
import '../../widgets/summary_cards.dart';
import '../../widgets/filter_chips.dart';
import '../../widgets/quest_list_item.dart';
import '../../models/quest_model.dart';
import '../../core/utils/mock_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data dari mock_data atau database nantinya
    final List<QuestModel> quests = MockData.getDailyQuests();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const CustomAppBar(title: 'Quests'),
            const SizedBox(height: 24),
            _buildMonthHeader(),
            const SizedBox(height: 16),
            const DateSelector(),
            const SizedBox(height: 24),
            const SummaryCards(
              percentage: 0.75,
              completed: 3,
              total: 7,
              streak: 12,
            ),
            const SizedBox(height: 24),
            const FilterChips(),
            const SizedBox(height: 16),

            // Looping data model ke dalam widget global
            ...quests.map((quest) => QuestListItem(quest: quest)).toList(),
          ],
        ),
      ),
    );
  }

  // Fungsi kecil spesifik halaman bisa tetap di sini, atau dipindah ke widgets/ jika mau dipakai di tempat lain
  Widget _buildMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Juli 2026',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          children: const [
            Icon(Icons.chevron_left, color: Colors.black54),
            SizedBox(width: 16),
            Icon(Icons.chevron_right, color: Colors.black54),
          ],
        ),
      ],
    );
  }
}
