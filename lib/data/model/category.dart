import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int id;
  final String label;
  final IconData icon;

  Category({required this.id, required this.label, required this.icon});
}

List<Category> listCategories = [
  Category(id: 0, label: "Band", icon: CupertinoIcons.guitars),
  Category(id: 1, label: "Menyanyi", icon: CupertinoIcons.music_mic),
  Category(id: 2, label: "Dance", icon: CupertinoIcons.music_note_2),
  Category(id: 3, label: "Drama", icon: CupertinoIcons.film),
];
