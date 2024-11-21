import 'package:flutter/material.dart';

class ManagerDrawer extends StatelessWidget {
  const ManagerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Manager',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/managerdashboard');
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Manage Dialect'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/managermanagedialect');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Manage Levels'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/managerlevel');
            },
          ),
          ListTile(
            leading: const Icon(Icons.translate),
            title: const Text('Manage Questions'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Add logout logic here
            },
          ),
        ],
      ),
    );
  }
}
