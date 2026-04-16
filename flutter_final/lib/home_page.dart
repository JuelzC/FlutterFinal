import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Task 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.check_circle_outline),
              Expanded(
                child: Text(
                  "Finish homework",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Text("Apr 15"),
            ],
          ),

          SizedBox(height: 20),

          // Task 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.check_circle_outline),
              Expanded(
                child: Text(
                  "Walk the dog",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Text("Apr 16"),
            ],
          ),

          SizedBox(height: 20),

          // Task 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.check_circle_outline),
              Expanded(
                child: Text(
                  "Clean room",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Text("Apr 17"),
            ],
          ),
        ],
      ),
    );
  }
}
