import 'package:flutter/material.dart';

import 'admin_drawer.dart';

class AdminManageuser extends StatefulWidget {
  const AdminManageuser({super.key});

  @override
  State<AdminManageuser> createState() => _AdminManageuserState();
}

class _AdminManageuserState extends State<AdminManageuser> {
  // Sample user data - replace with your actual data source
  final List<Map<String, String>> users = [
    {
      'name': 'Seve Usero',
      'email': 'Laykusero04@gmail.com',
      'joinDate': 'Joined March 2025'
    },
    {
      'name': 'John Doe',
      'email': 'john.doe@gmail.com',
      'joinDate': 'Joined January 2025'
    },
    {
      'name': 'Jane Smith',
      'email': 'jane.smith@gmail.com',
      'joinDate': 'Joined February 2025'
    },
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Manage User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Filter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      drawer: AdminDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    users[index]['name'] ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    users[index]['email'] ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    users[index]['joinDate'] ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic for adding new users
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
