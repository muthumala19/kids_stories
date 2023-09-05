import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database_helper.dart';

final dbHelper = StoryDatabaseHelper.instance;

// Insert a story ID

class MarkAsReadNotifier extends StateNotifier<List<String>> {
  MarkAsReadNotifier() : super(const []);

  Future<void> loadCompletedStoryIdList() async {
    state = await dbHelper.getStories();
  }

  Future<void> toggleMarkAsRead(String id, bool isCompleted) async {
    if (isCompleted) {
      await dbHelper.insertStory(id);
            state = [id,...state];

    } else {
      await dbHelper.deleteStory(id);
      state = state.where((element) => element != id).toList().reversed.toList();
    }
  }
}

final markAsReadProvider =
    StateNotifierProvider<MarkAsReadNotifier, List<String>>(
  (ref) {
    return MarkAsReadNotifier();
  },
);
