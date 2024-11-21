import 'package:flutter/material.dart';

import 'manager_drawer.dart';

class ManageLevel extends StatefulWidget {
  const ManageLevel({super.key});

  @override
  State<ManageLevel> createState() => _ManageLevelState();
}

class _ManageLevelState extends State<ManageLevel> {
  // Sample data - replace with your actual data
  final List<Map<String, dynamic>> levels = [
    {
      'level': 'Level 1',
      'categories': ['Question 1', 'Question 2', 'Question 3']
    },
    {
      'level': 'Level 2',
      'categories': ['Question 4', 'Question 5', 'Question 6']
    },
    {
      'level': 'Level 3',
      'categories': ['Question 7', 'Question 8', 'Question 9']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Manage Categories and Level',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton.icon(
              onPressed: () {
                // Add filter functionality here
              },
              icon: const Icon(
                Icons.filter_list,
                color: Colors.white,
              ),
              label: const Text(
                'Filter',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const ManagerDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  levels[index]['level'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: levels[index]['categories'].length,
                    itemBuilder: (context, categoryIndex) {
                      return ListTile(
                        leading: const Icon(Icons.category, color: Colors.red),
                        title: Text(
                          levels[index]['categories'][categoryIndex],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                // Add edit functionality
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Add delete functionality
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/managerquestion');
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text(
                        'Add Question',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          // Add new level functionality
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
