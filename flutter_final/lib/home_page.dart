import 'package:flutter/material.dart';
import 'task_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TaskFlow"),
        backgroundColor: Colors.teal,
      ),

      body: Column(
        children: const [
          TaskCard(
            title: "Finish homework",
            date: "Apr 15",
            priorityColor: Colors.green,
          ),
          TaskCard(
            title: "Walk the dog",
            date: "Apr 16",
            priorityColor: Colors.amber,
          ),
          TaskCard(
            title: "Clean room",
            date: "Apr 17",
            priorityColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
