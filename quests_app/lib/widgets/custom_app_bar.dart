import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/100',
          ), // Ganti dengan asset lokal nantinya
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.help_outline, color: Colors.black87),
              onPressed: () {
                // Aksi tombol bantuan
              },
            ),
            IconButton(
              icon: const Icon(Icons.inbox_outlined, color: Colors.black87),
              onPressed: () {
                // Aksi tombol inbox
              },
            ),
          ],
        ),
      ],
    );
  }
}
