import 'package:flutter/material.dart';

class CreateQuestScreen extends StatelessWidget {
  const CreateQuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Quest Baru')),
      body: const Center(
        child: Text('Halaman form untuk membuat quest akan ada di sini.'),
      ),
    );
  }
}
