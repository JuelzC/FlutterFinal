import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("TaskFlow"), backgroundColor: Colors.teal,),
        body: Center(
          child: Column(
            children: [
              Icon(Icons.check_circle_outline, size: 100,),
              Text(
                  "No Tasks Yet",
                style: TextStyle(fontSize: 22)
              ),
              Text(
                  "Tap + to add your first task",
                style: TextStyle(fontSize: 16)
              ),
              FloatingActionButton(
                  onPressed: () {
                    print("Button Clicked");
                  },
                child: const Icon(Icons.add),
              )
            ],
          ),
        ),
        ),
      );
  }
}

