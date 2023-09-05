import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids_stories/providers/bottom_navigation_provider.dart';

class BottomNavigationTabs extends ConsumerStatefulWidget {
  const BottomNavigationTabs({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavigationTabs> createState() =>
      _BottomNavigationTabsState();
}

class _BottomNavigationTabsState extends ConsumerState<BottomNavigationTabs> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .secondaryContainer,
      activeColor: Theme
          .of(context)
          .colorScheme
          .primary,
      color: Theme
          .of(context)
          .colorScheme
          .primary,
      initialActiveIndex: ref.watch(bottomNavBarSelectionProvider),
      items: const [
        TabItem(icon: Icons.home_outlined, title: 'Home'),
        TabItem(icon: Icons.all_inclusive_outlined, title: 'All'),
        TabItem(
            icon: Icons.task_alt_rounded,
            title: 'Completed'),
      ],
      onTap: (index) {
        setState(
              () {
            ref
                .read(bottomNavBarSelectionProvider.notifier)
                .selectBottomNavBar(index);
          },
        );
      },
    );
  }
}
