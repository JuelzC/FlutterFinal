import 'package:flutter/material.dart';

class Task {
  final int id;
  final String title;
  final String category;
  final String dueDate;
  final Color priorityColor;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.dueDate,
    required this.priorityColor,
    required this.isCompleted,
  });
}