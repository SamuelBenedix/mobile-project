import 'package:flutter/material.dart';
import 'screens/main_layout.dart'; // Sesuaikan path jika letak file main_layout.dart berbeda

void main() {
  runApp(const QuestsApp());
}

class QuestsApp extends StatelessWidget {
  const QuestsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quests App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Roboto', // Atau font lain yang Anda gunakan
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const MainLayout(),
    );
  }
}
