import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream of auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign in with email and password
  Future<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      debugPrint('Attempting to sign in with email: $email');

      // Attempt to sign in
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      debugPrint('Sign in successful, user ID: ${userCredential.user?.uid}');

      if (userCredential.user != null) {
        // Get user role from Firestore
        debugPrint('Fetching user document from Firestore');

        final DocumentSnapshot userDoc = await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        debugPrint('User document exists: ${userDoc.exists}');

        if (userDoc.exists) {
          final userData = userDoc.data() as Map<String, dynamic>;
          final int role = userData['role'] ?? 3;

          debugPrint('User role: $role');

          // Make sure we're using BuildContext safely
          if (!context.mounted) {
            debugPrint('Context is no longer mounted, cannot navigate');
            return 'Navigation failed: context is no longer mounted';
          }

          // Navigate based on role using Navigator.pushNamedAndRemoveUntil
          String route;
          switch (role) {
            case 1:
              route = '/admindashboard';
              break;
            case 2:
              route = '/managerdashboard';
              break;
            case 3:
              route = '/userdashboard';
              break;
            default:
              route = '/userdashboard';
          }

          debugPrint('Attempting to navigate to: $route');

          await Navigator.pushNamedAndRemoveUntil(
            context,
            route,
            (route) => false, // This clears the navigation stack
          );

          debugPrint('Navigation completed successfully');
          return null;
        } else {
          debugPrint('User document not found, signing out');
          await _auth.signOut();
          return 'User data not found';
        }
      }
      return 'Something went wrong';
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code} - ${e.message}');
      switch (e.code) {
        case 'user-not-found':
          return 'No user found with this email';
        case 'wrong-password':
          return 'Wrong password provided';
        case 'user-disabled':
          return 'This account has been disabled';
        case 'invalid-email':
          return 'Invalid email address';
        default:
          return 'An error occurred: ${e.message}';
      }
    } catch (e) {
      debugPrint('Unexpected error during sign in: $e');
      return 'An unexpected error occurred: $e';
    }
  }

  Future<String?> signOut(BuildContext context) async {
    try {
      debugPrint('Attempting to sign out user');
      await _auth.signOut();
      debugPrint('Sign out successful');

      // Make sure context is still valid
      if (!context.mounted) {
        debugPrint('Context is no longer mounted, cannot navigate');
        return 'Navigation failed: context is no longer mounted';
      }

      // Navigate to login screen and clear navigation stack
      await Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );

      debugPrint('Navigation to login screen completed');
      return null;
    } catch (e) {
      debugPrint('Error during sign out: $e');
      return 'An error occurred during sign out: $e';
    }
  }
}
