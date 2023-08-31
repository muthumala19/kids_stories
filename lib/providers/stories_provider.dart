import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/story_model.dart';

class StoriesNotifier extends StateNotifier<List<Story>> {
  StoriesNotifier() : super([]);

  Future<void> fetchFirestoreStories() async {
    List<Story> stories = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('stories').get();
    for (var doc in querySnapshot.docs) {
      stories.add(
        Story(
          id: doc.id,
          title: doc['title'],
          imageUrl: doc['imageUrl'],
          categories: (doc['categories'] as List)
              .map((item) => item as String)
              .toList(),
          complexity: Complexity.values
              .firstWhere((e) => e.toString() == doc['complexity']),
          duration: doc['duration'],
          paragraphs:
              (doc['paragraphs'] as List).map((e) => e as String).toList(),
        ),
      );
    }
    state=[...stories];

  }
}

final storiesProvider = StateNotifierProvider<StoriesNotifier, List<Story>>(
  (ref) {
    return StoriesNotifier();
  },
);
