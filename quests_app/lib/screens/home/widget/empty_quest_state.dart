import 'package:flutter/material.dart';
import 'package:quests_app/screens/add_quest/create_quest_screen.dart';
// Sesuaikan import ini dengan lokasi file halaman baru kamu

class EmptyQuestState extends StatelessWidget {
  const EmptyQuestState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'Kamu belum memiliki quest yang aktif.\nTambahkan quest baru untuk mulai melacak progress.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // Navigasi (Redirect) ke halaman CreateQuestScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateQuestScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add, color: Colors.black87, size: 20),
            label: const Text(
              'Buat Quest',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 1,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
