import 'package:flutter_riverpod/flutter_riverpod.dart';


class BottomNavBarSelectionNotifier extends StateNotifier<int> {
  BottomNavBarSelectionNotifier() : super(0);

  void selectBottomNavBar(int index) {
    state = index;
  }
}

final bottomNavBarSelectionProvider =
    StateNotifierProvider<BottomNavBarSelectionNotifier, int>(
  (ref) {
    return BottomNavBarSelectionNotifier();
  },
);
