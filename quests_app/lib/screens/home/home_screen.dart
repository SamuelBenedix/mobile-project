import 'package:flutter/material.dart';
import 'package:quests_app/screens/home/widget/empty_quest_state.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/date_selector.dart';
import '../../widgets/summary_cards.dart';
import '../../widgets/filter_chips.dart';
import '../../widgets/quest_list_item.dart';
// Import widget baru di sini
import '../../models/quest_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<QuestModel> quests = []; // Ceritanya kosong

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const CustomAppBar(title: 'Quests'),
            const SizedBox(height: 16),
            const DateSelector(),
            const SummaryCards(
              percentage: 0.75,
              completed: 3,
              total: 7,
              streak: 12,
            ),
            const SizedBox(height: 24),
            const FilterChips(),
            const SizedBox(height: 16),

            // Panggil widget yang sudah dipisah ke folder widgets
            if (quests.isEmpty)
              const EmptyQuestState()
            else
              ...quests.map((quest) => QuestListItem(quest: quest)).toList(),
          ],
        ),
      ),
    );
  }
}
