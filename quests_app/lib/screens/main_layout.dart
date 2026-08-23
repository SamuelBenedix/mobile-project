import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import '../widgets/custom_bottom_nav.dart';

// Placeholder untuk screen tab lain (bisa dipindah ke file terpisah nanti jika sudah dibuat)
class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Leaderboard Screen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Community Screen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  // Daftar screen yang diatur oleh bottom navigation
  final List<Widget> _screens = const [
    HomeScreen(),
    LeaderboardScreen(),
    CommunityScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // IndexedStack menjaga agar state halaman tidak hilang saat berpindah tab
          IndexedStack(index: _currentIndex, children: _screens),

          // Navigasi bawah melayang (Floating Bottom Navigation)
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: CustomBottomNav(
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
            ),
          ),
        ],
      ),
    );
  }
}
