enum Complexity {
  simple,
  challenging,
  hard,
}

class Story {
  const Story({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.categories,
    required this.complexity,
    required this.duration,
    required this.paragraphs,
  });

  final String id;
  final String title;
  final String imageURL;
  final List<String> categories;
  final Complexity complexity;
  final int duration;
  final List<String> paragraphs;
}
