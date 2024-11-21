import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wikato/firebase_options.dart';

import 'admin/admin_dashboard.dart';
import 'admin/admin_feedback.dart';
import 'admin/admin_managedialect.dart';
import 'admin/admin_manageuser.dart';
import 'login.dart';
import 'manager/manage_level.dart';
import 'manager/manager_dashboard.dart';
import 'manager/manager_managedialect.dart';
import 'manager/manager_question.dart';
import 'onboarding_screen.dart';
import 'user/userdashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "wikato",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wikato',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnbordingScreen(),
        '/login': (context) => const LoginPage(),
        '/admindashboard': (context) => const AdminDashboard(),
        '/adminfeedback': (context) => const AdminFeedback(),
        '/adminmanageuser': (context) => const AdminManageuser(),
        '/adminmanagedialect': (context) => const AdminManagedialect(),
        '/managerdashboard': (context) => const ManagerDashboard(),
        '/managermanagedialect': (context) => const ManagerManagedialect(),
        '/managerlevel': (context) => const ManageLevel(),
        '/managerquestion': (context) => const ManagerQuestion(),
        '/userdashboard': (context) => const UserDashboard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
