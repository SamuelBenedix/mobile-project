import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Tambahkan padding di sini agar menunya mengambang (floating) rapi di atas tepi layar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 1. Elemen Kiri: Pill Container untuk Menu Navigasi
          Container(
            // Padding luar diperkecil agar keseluruhan pil lebih ramping
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNavItem(icon: Icons.list_alt, label: 'Quests', index: 0),
                const SizedBox(width: 4),
                _buildNavItem(
                  icon: Icons.emoji_events_outlined,
                  label: 'Leaderboard',
                  index: 1,
                ),
                const SizedBox(width: 4),
                _buildNavItem(
                  icon: Icons.people_outline,
                  label: 'Profile',
                  index: 2,
                ),
              ],
            ),
          ),

          // 2. Elemen Kanan: Floating Action Button (FAB)
          Container(
            width: 50, // Sedikit diperkecil menyesuaikan menu pill
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.black87, size: 22),
              onPressed: () {
                // TODO: Aksi untuk tombol tambah (+)
                print("Tombol Tambah Ditekan");
              },
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi helper
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 450), // Durasi diperlambat
        curve: Curves
            .easeOutCubic, // Memberikan efek pergerakan yang mulus di akhir
        // Padding dalam item diperkecil
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black54,
              size: 22, // Ukuran ikon diperkecil
            ),
            // Menggunakan ClipRect & AnimatedSize agar animasi melebar/menyusutnya teks sangat mulus
            ClipRect(
              child: AnimatedSize(
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeOutCubic,
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  // Jika tidak dipilih, lebar diset 0. Jika dipilih, biarkan otomatis (null) menyesuaikan teks
                  width: isSelected ? null : 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 6), // Jarak teks & ikon
                      Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13, // Ukuran teks sedikit diperkecil
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
