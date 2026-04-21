import 'package:flutter/material.dart';
import 'task.dart';
import 'task_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Task> tasks = [
    Task(
      id: 1,
      title: "Finish homework",
      category: "School",
      dueDate: "Apr 15",
      priorityColor: Colors.green,
      isCompleted: false,
    ),
    Task(
      id: 2,
      title: "Walk the dog",
      category: "Personal",
      dueDate: "Apr 16",
      priorityColor: Colors.amber,
      isCompleted: true,
    ),
    Task(
      id: 3,
      title: "Clean room",
      category: "Home",
      dueDate: "Apr 17",
      priorityColor: Colors.red,
      isCompleted: false,
    ),
    Task(
      id: 4,
      title: "Study Flutter",
      category: "School",
      dueDate: "Apr 18",
      priorityColor: Colors.red,
      isCompleted: false,
    ),
    Task(
      id: 5,
      title: "Read manga",
      category: "Fun",
      dueDate: "Apr 19",
      priorityColor: Colors.blue,
      isCompleted: false,
    ),
    Task(
      id: 6,
      title: "Buy groceries",
      category: "Personal",
      dueDate: "Apr 20",
      priorityColor: Colors.amber,
      isCompleted: false,
    ),
    Task(
      id: 7,
      title: "Workout",
      category: "Health",
      dueDate: "Apr 21",
      priorityColor: Colors.green,
      isCompleted: true,
    ),
    Task(
      id: 8,
      title: "Finish app",
      category: "Work",
      dueDate: "Apr 22",
      priorityColor: Colors.red,
      isCompleted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TaskFlow"),
        backgroundColor: Colors.teal,
      ),

      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Chip(label: Text("All")),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Chip(label: Text("School")),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Chip(label: Text("Personal")),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Chip(label: Text("Work")),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              itemCount: tasks.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final task = tasks[index];

                return Stack(
                  children: [
                    TaskCard(
                      title: task.title,
                      date: task.dueDate,
                      priorityColor: task.priorityColor,
                    ),

                    if (task.isCompleted)
                      const Positioned(
                        top: 10,
                        right: 20,
                        child: Icon(
                          Icons.check_circle,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
