import 'package:flutter/material.dart';
import 'package:flutter_final/task.dart';
import 'package:flutter_final/task_card.dart';
import 'package:flutter_final/add_task_page.dart';
import 'package:flutter_final/task_detail_page.dart';

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
    print("Page Transitioned");
  }

  List<Task> tasks = [
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

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
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
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskPage(),
            ),
          );

          if (newTask != null && newTask is Task) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        child: const Icon(Icons.add),
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

                return Dismissible(
                  key: Key(task.id.toString()),
                  onDismissed: (direction) {
                    setState(() {
                      tasks.removeAt(index);
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TaskDetailPage(task: task),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        TaskCard(
                          title: task.title,
                          date: task.dueDate,
                          priorityColor: task.priorityColor,
                        ),

                        Positioned(
                          top: 10,
                          right: 20,
                          child: IconButton(
                            icon: Icon(
                              task.isCompleted
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                task.isCompleted =
                                !task.isCompleted;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
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
