import 'package:flutter/material.dart';
import '../models/quest_model.dart'; // Pastikan path ini sesuai

class QuestListItem extends StatelessWidget {
  final QuestModel quest;

  const QuestListItem({super.key, required this.quest});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;

    // Logika warna dan teks berdasarkan status
    switch (quest.status) {
      case 'selesai':
        statusColor = Colors.green;
        statusText = 'Selesai';
        break;
      case 'gagal':
        statusColor = Colors.red;
        statusText = 'Gagal';
        break;
      case 'dilewati':
        statusColor = Colors.blue;
        statusText = 'Dilewati';
        break;
      case 'proses':
      default:
        statusColor = Colors.orange;
        statusText = quest.time; // Tampilkan jam jika masih proses
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 4, backgroundColor: statusColor),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quest.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: quest.status == 'dilewati'
                          ? Colors.grey
                          : Colors.black,
                      decoration:
                          quest.status == 'gagal' || quest.status == 'dilewati'
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Setiap Hari · Foto Langsung',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                statusText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: quest.status == 'proses' ? Colors.black : statusColor,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text('🔥', style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 4),
                  Text(
                    '${quest.streak}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
