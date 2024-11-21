import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class AdminDrawer extends StatelessWidget {
  final AuthService _authService = AuthService();

  AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[50],
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
                  'Admin',
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
              Navigator.pushReplacementNamed(context, '/admindashboard');
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/adminfeedback');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Manage User'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/adminmanageuser');
            },
          ),
          ListTile(
            leading: const Icon(Icons.translate),
            title: const Text('Manage Dialect'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/adminmanagedialect');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              // Show loading dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );

              // Attempt to sign out
              final String? error = await _authService.signOut(context);

              // If there was an error, show it to the user
              if (error != null && context.mounted) {
                // Remove the loading dialog
                Navigator.pop(context);

                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
