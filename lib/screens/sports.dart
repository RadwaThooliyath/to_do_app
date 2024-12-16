import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  final Map<String, List<Map<String, dynamic>>> taskCategories = {
    "Today": [
      {"task": "Morning run", "isChecked": false},
      {"task": "Watch a game", "isChecked": false},
    ],
    "Tomorrow": [
      {"task": "Evening walk", "isChecked": false},
      {"task": "Attend sports class", "isChecked": false},
    ],
    "Nov 17,Monday": [
      {"task": "Book tickets for match", "isChecked": false},
      {"task": "Plan training schedule", "isChecked": false},
    ],
  };

  bool _isAddTaskVisible = false;
  TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sports"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Search button pressed")),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ...taskCategories.entries.map((category) {
                  return _buildCategorySection(category.key, category.value);
                }).toList(),
              ],
            ),
          ),
          if (_isAddTaskVisible)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: _buildAddTaskContainer(),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isAddTaskVisible = !_isAddTaskVisible;
          });
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildAddTaskContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      _isAddTaskVisible = false;
                    });
                  },
                ),
              ],
            ),
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                hintText: 'Enter your task',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String category, List<Map<String, dynamic>> tasks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...tasks.map((task) {
          return _buildTask(task);
        }).toList(),
      ],
    );
  }

  Widget _buildTask(Map<String, dynamic> task) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              setState(() {
                task['isChecked'] = !task['isChecked'];
              });
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: task['isChecked'] ? Colors.green : Colors.transparent,
                border: Border.all(
                  color: task['isChecked'] ? Colors.green : Colors.grey,
                  width: 2,
                ),
              ),
              child: task['isChecked']
                  ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              task['task'],
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
