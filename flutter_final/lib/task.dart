import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final String category;
  final String dueDate;
  final int priorityColor;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.dueDate,
    required this.priorityColor,
    required this.isCompleted,
  });

  // 🔥 Firestore → Task
  factory Task.fromJson(String id, Map<String, dynamic> json) {
    return Task(
      id: id,
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      dueDate: json['dueDate'] ?? '',
      priorityColor: json['priorityColor'] ?? 0xFF000000,
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  // 🔥 Task → Firestore
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'dueDate': dueDate,
      'priorityColor': priorityColor,
      'isCompleted': isCompleted,
    };
  }

  Color get color => Color(priorityColor);
}