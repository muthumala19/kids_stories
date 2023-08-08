import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationTabs extends StatefulWidget {
  const BottomNavigationTabs({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTabs> createState() => _BottomNavigationTabsState();
}

class _BottomNavigationTabsState extends State<BottomNavigationTabs> {
  var _currentTab = 0;

  void _selectedTab(int index) {
    setState(() {
      _currentTab = index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.primaryContainer;
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          backgroundColor: backgroundColor,
          icon: const Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: backgroundColor,
          icon: const Icon(Icons.all_inclusive_outlined),
          label: 'All',
        ),
        BottomNavigationBarItem(
          backgroundColor: backgroundColor,
          icon: const Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          backgroundColor: backgroundColor,
          icon: const Icon(Icons.trending_up_outlined),
          label: 'Trending',
        ),
      ],
      currentIndex: _currentTab,
      onTap: _selectedTab,
      backgroundColor: backgroundColor,
      type: BottomNavigationBarType.shifting,
      showUnselectedLabels: true,
      selectedLabelStyle:
          GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 15),
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.primary,
    );
  }
}
