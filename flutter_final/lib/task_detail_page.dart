import 'package:flutter/material.dart';
import 'task.dart';

class TaskDetailPage extends StatelessWidget {
  final Task task;

  const TaskDetailPage({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text("Category: ${task.category}"),
            Text("Due Date: ${task.dueDate}"),
            Text(
              "Status: ${task.isCompleted ? "Completed" : "Pending"}",
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}