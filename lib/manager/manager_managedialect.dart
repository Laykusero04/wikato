import 'package:flutter/material.dart';
import 'package:wikato/manager/manager_drawer.dart';

class ManagerManagedialect extends StatefulWidget {
  const ManagerManagedialect({super.key});

  @override
  State<ManagerManagedialect> createState() => _ManagerManagedialectState();
}

class _ManagerManagedialectState extends State<ManagerManagedialect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.5,
        title: const Text(
          'Manage Dialect',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Filter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      drawer: const ManagerDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            buildDialectCard('Tagalog', 'March 2, 2025'),
            buildDialectCard('Cebuano', 'April 5, 2025'),
            buildDialectCard('Ilocano', 'June 10, 2025'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Widget to build a dialect card with consistent styling
  Widget buildDialectCard(String title, String dateCreated) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      shadowColor: Colors.grey.shade200,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/managerlevel');
        },
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            'Date Created: $dateCreated',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.red,
            size: 18,
          ),
        ),
      ),
    );
  }
}
