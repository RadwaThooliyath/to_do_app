import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/profile_image.png'), // Replace with your profile image
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'John Doe', // Replace with dynamic name
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'New York, USA', // Replace with dynamic place
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Edit button as TextButton with Edit icon in black circle
                    TextButton(
                      onPressed: () {
                        // Handle edit action
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black, // Black background
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white, // White color for the icon
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Description Section
              const Text(
                'This is a short description about the user. It gives insights '
                    'into their profile and interests.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),

              // Settings List
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildListTile(
                    icon: Icons.notifications,
                    title: 'Notification',
                    onTap: () {
                      // Handle Notification tap
                    },
                  ),
                  _buildListTile(
                    icon: Icons.settings,
                    title: 'General',
                    onTap: () {
                      // Handle General tap
                    },
                  ),
                  _buildListTile(
                    icon: Icons.account_circle,
                    title: 'Account',
                    onTap: () {
                      // Handle Account tap
                    },
                  ),
                  _buildListTile(
                    icon: Icons.info,
                    title: 'About',
                    onTap: () {
                      // Handle About tap
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build list tiles with black icons
  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black), // Set icon color to black
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
