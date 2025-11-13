import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../fragments/biodata_fragment.dart';
import '../fragments/kontak_fragment.dart';
import '../fragments/kalkulator_fragment.dart';
import '../fragments/cuaca_fragment.dart';
import '../fragments/berita_fragment.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _fragments = [
    const BiodataFragment(),
    const KontakFragment(),
    const KalkulatorFragment(),
    const CuacaFragment(),
    const BeritaFragment(),
  ];

  final List<String> _titles = [
    'Biodata',
    'Kontak',
    'Kalkulator',
    'Cuaca',
    'Berita',
  ];

  final List<IconData> _icons = [
    Icons.person_outline_rounded,
    Icons.contacts_outlined,
    Icons.calculate_outlined,
    Icons.wb_sunny_outlined,
    Icons.article_outlined,
  ];

  final List<IconData> _iconsSelected = [
    Icons.person_rounded,
    Icons.contacts_rounded,
    Icons.calculate_rounded,
    Icons.wb_sunny_rounded,
    Icons.article_rounded,
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      HapticFeedback.selectionClick();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // ← mencegah overflow
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            color: Color(0xFF1D1D1F),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: Container(
          key: ValueKey<int>(_selectedIndex),
          child: _fragments[_selectedIndex],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 24,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                final isSelected = _selectedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => _onItemTapped(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF007AFF).withOpacity(0.08)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isSelected ? _iconsSelected[index] : _icons[index],
                            color: isSelected
                                ? const Color(0xFF007AFF)
                                : const Color(0xFF8E8E93),
                            size: 24,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            _titles[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: isSelected
                                  ? const Color(0xFF007AFF)
                                  : const Color(0xFF8E8E93),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
