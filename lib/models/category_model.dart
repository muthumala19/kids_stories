import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    required this.color,
    required this.imagePath,
  });

  final String id;
  final String title;
  final String imagePath;
  final Color color;
}
