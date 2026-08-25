import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime _currentMonth;
  late DateTime _selectedDate;

  // 1. Tambahkan ScrollController
  late ScrollController _scrollController;
  // Lebar per item (45 lebar kotak + 12 jarak padding)
  final double _itemWidth = 57.0;

  final List<String> _monthNames = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];
  final List<String> _dayNames = [
    "Sen",
    "Sel",
    "Rab",
    "Kam",
    "Jum",
    "Sab",
    "Min",
  ];

  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    _currentMonth = DateTime(today.year, today.month);
    _selectedDate = DateTime(today.year, today.month, today.day);

    // 2. Hitung posisi scroll awal agar tanggal hari ini ada di paling kiri
    double initialOffset = (today.day - 1) * _itemWidth;

    // Inisialisasi controller dengan posisi awal tersebut
    _scrollController = ScrollController(initialScrollOffset: initialOffset);
  }

  // Jangan lupa matikan controller saat widget dihancurkan untuk mencegah memory leak
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
      // 3. Kembalikan posisi scroll ke kiri (tanggal 1) saat ganti bulan
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
      // 3. Kembalikan posisi scroll ke kiri (tanggal 1) saat ganti bulan
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    int totalDays = getDaysInMonth(_currentMonth.year, _currentMonth.month);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_monthNames[_currentMonth.month - 1]} ${_currentMonth.year}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: _previousMonth,
                  icon: const Icon(Icons.chevron_left, color: Colors.black54),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: _nextMonth,
                  icon: const Icon(Icons.chevron_right, color: Colors.black54),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController, // 4. Pasang ScrollController di sini
          child: Row(
            children: List.generate(totalDays, (index) {
              DateTime date = DateTime(
                _currentMonth.year,
                _currentMonth.month,
                index + 1,
              );

              bool isActive =
                  date.year == _selectedDate.year &&
                  date.month == _selectedDate.month &&
                  date.day == _selectedDate.day;

              String dayName = _dayNames[date.weekday - 1];
              String dateNumber = date.day.toString();
              bool hasFire = date.day == 17;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Column(
                    children: [
                      Text(
                        dayName,
                        style: TextStyle(
                          color: isActive ? Colors.black : Colors.grey,
                          fontSize: 12,
                          fontWeight: isActive
                              ? FontWeight.bold
                              : FontWeight.normal,
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
                            dateNumber,
                            style: TextStyle(
                              color: isActive ? Colors.white : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (hasFire)
                        const Text('🔥', style: TextStyle(fontSize: 10))
                      else
                        const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
