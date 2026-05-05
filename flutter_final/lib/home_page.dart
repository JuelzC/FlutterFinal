import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'task.dart';
import 'task_card.dart';
import 'add_task_page.dart';
import 'task_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TaskFlow"),
        backgroundColor: Colors.teal,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text("TaskFlow"),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text("Sign Out"),
              onTap: () {
                print("Signed out");
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          // 🔹 Category chips (still UI only for now)
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

          // 🔥 FIREBASE STREAM START
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('tasks')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final docs = snapshot.data!.docs;

                if (docs.isEmpty) {
                  return const Center(
                    child: Text("No tasks yet"),
                  );
                }

                return ListView.separated(
                  itemCount: docs.length,
                  separatorBuilder: (context, index) =>
                  const Divider(height: 0),
                  itemBuilder: (context, index) {
                    final doc = docs[index];

                    final task = Task.fromJson(
                      doc.id,
                      doc.data(),
                    );

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TaskDetailPage(task: task),
                          ),
                        );
                      },

                      // 🔥 YOUR TASK CARD
                      child: TaskCard(
                        id: task.id,
                        title: task.title,
                        date: task.dueDate,
                        isCompleted: task.isCompleted,
                        priorityColor: task.color,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: "Tasks",
            icon: Icon(Icons.task),
          ),
          BottomNavigationBarItem(
            label: "Categories",
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person_outlined),
          ),
        ],
      ),
    );
  }
}