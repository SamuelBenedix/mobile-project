import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk UI, nantinya bisa di-generate dinamis menggunakan DateTime
    final List<Map<String, dynamic>> dates = [
      {'day': 'Sen', 'date': '17', 'active': false, 'hasFire': true},
      {'day': 'Sel', 'date': '18', 'active': true, 'hasFire': false},
      {'day': 'Rab', 'date': '19', 'active': false, 'hasFire': false},
      {'day': 'Kam', 'date': '20', 'active': false, 'hasFire': false},
      {'day': 'Jum', 'date': '21', 'active': false, 'hasFire': false},
      {'day': 'Sab', 'date': '22', 'active': false, 'hasFire': false},
      {'day': 'Min', 'date': '23', 'active': false, 'hasFire': false},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dates.map((d) {
          bool isActive = d['active'] as bool;
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Column(
              children: [
                Text(
                  d['day'] as String,
                  style: TextStyle(
                    color: isActive ? Colors.black : Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 45,
                  height: 55,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      d['date'] as String,
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                if (d['hasFire'] as bool)
                  const Text('🔥', style: TextStyle(fontSize: 10))
                else
                  const SizedBox(height: 10), // Placeholder agar tinggi sejajar
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
