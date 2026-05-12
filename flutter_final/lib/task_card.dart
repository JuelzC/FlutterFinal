import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskCard extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final bool isCompleted;
  final Color priorityColor;

  const TaskCard({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.isCompleted,
    required this.priorityColor,
  });

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    return Dismissible(
      key: Key(id),

      // 🔥 DELETE
      onDismissed: (direction) {
        if (uid != null) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .collection('tasks')
              .doc(id)
              .delete();
        }
      },

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(16),
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
        child: Row(
          children: [
            // Priority bar
            Container(
              width: 4,
              height: 40,
              color: priorityColor,
            ),

            const SizedBox(width: 12),

            const Icon(Icons.check_circle_outline),

            const SizedBox(width: 12),

            // Title
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  decoration: isCompleted ? TextDecoration.lineThrough : null,
                  color: isCompleted ? Colors.grey : Colors.black,
                ),
              ),
            ),

            // Date
            Text(date),

            const SizedBox(width: 10),

            // 🔥 COMPLETE
            Checkbox(
              value: isCompleted,
              activeColor: Colors.teal,
              onChanged: (value) {
                if (uid != null) {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .collection('tasks')
                      .doc(id)
                      .update({'isCompleted': value});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
