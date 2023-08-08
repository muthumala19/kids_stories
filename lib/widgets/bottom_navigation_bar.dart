import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationTabs extends StatefulWidget {
  const BottomNavigationTabs({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTabs> createState() => _BottomNavigationTabsState();
}

class _BottomNavigationTabsState extends State<BottomNavigationTabs> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      activeColor: Theme.of(context).colorScheme.primary,
      color: Theme.of(context).colorScheme.primary,
      initialActiveIndex: 0,
      items: const [
        TabItem(icon: Icons.home_outlined, title: 'Home'),
        TabItem(icon: Icons.all_inclusive_outlined, title: 'All'),
        TabItem(icon: Icons.favorite, title: 'Favourite'),
        TabItem(icon: Icons.trending_up_outlined, title: 'Trending'),
      ],
    );
  }
}
