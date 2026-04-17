import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String date;
  final Color priorityColor;

  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.priorityColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Priority color strip
            Container(
              width: 4,
              height: 40,
              color: priorityColor,
            ),

            const SizedBox(width: 12),

            const Icon(Icons.check_circle_outline),

            const SizedBox(width: 12),

            // Task title
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
            ),

            // Date
            Text(date),
          ],
        ),
      ),
    );
  }
}