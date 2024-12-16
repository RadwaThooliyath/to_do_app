import 'package:flutter/material.dart';
import 'package:to_do_app/screens/settingsPage.dart';
import 'package:to_do_app/screens/sports.dart'; // Import the SettingsPage

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // Define the task names, images, and counts
  final List<String> taskNames = [
    'Home', 'Sports', 'Homework', 'E-learning', 'Shopping', 'Food', 'Design',
  ];

  final List<String> taskImages = [
    'assets/home.png', 'assets/sports.png', 'assets/homework.png', 'assets/elearning.png',
    'assets/shopping.png', 'assets/food.png', 'assets/design.png',
  ];

  final List<String> taskCounts = [
    '10 Tasks', '5 Tasks', '13 Tasks', '4 Tasks', '9 Tasks', '1 Task', '3 Tasks',
  ];

  // Controllers for text fields in the modal
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              // Navigate to SettingsPage when profile image is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile_image.png'), // Replace with your profile image asset
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Category",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile and Quote Container
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "“The future belongs to those who believe in the beauty of their dreams.”",
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // GridView Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: taskNames.length + 1, // Add 1 for the "+" icon grid item
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Fixed 2 items per row
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // First grid item as "+" icon styled like a grid item
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: const Offset(0, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: Center(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Show modal bottom sheet when "+" is pressed
                              _showAddTaskModal(context);
                            },
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Display task details in the rest of the grid
                    int taskIndex = index - 1; // Adjust index for task list
                    return GestureDetector(
                      onTap: () {
                        if (taskNames[taskIndex] == 'Sports') {
                          // Navigate to the Sports Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SportsPage(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 2.0,
                              offset: const Offset(0, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                taskImages[taskIndex], // Display corresponding image
                                height: 40, // Set small size
                                width: 40,
                                fit: BoxFit.contain, // Icon-like appearance
                              ),
                              const SizedBox(height: 8),
                              Text(
                                taskNames[taskIndex], // Display corresponding task name
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${taskCounts[taskIndex]}', // Display task count
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to show modal bottom sheet
  void _showAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Makes the modal expand to fit content
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cross icon to close the modal
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close the modal
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Smiling emoji above the Title TextField
                  const Text(
                    "😊", // Smiling emoji
                    style: TextStyle(fontSize: 32), // Adjust size if needed
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText: "Title",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none, // Removed underline
                      filled: true,
                      fillColor: Color(0xFFF5F5F5), // Light background color
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Smiling emoji above the Count TextField

                  const SizedBox(height: 8),
                  TextField(
                    controller: _countController,
                    decoration: const InputDecoration(
                      hintText: "0 Tasks",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none, // Removed underline
                      filled: true,
                      fillColor: Color(0xFFF5F5F5), // Light background color
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
