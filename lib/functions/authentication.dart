import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // Create the user in Firebase Authentication
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the current user
      User? user = _auth.currentUser;

      // Update the user profile with the provided username
      await user?.updateProfile(displayName: username);

      return null; // Success, no error message
    } on FirebaseAuthException catch (e) {
      return e.message; // Return the error message
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Success, no error message
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Email or password may be incorrect.';
      } else if (e.code == 'wrong-password') {
        return 'Email or password may be incorrect.';
      } else {
        return e.message;
      }
    } catch (e) {
      return 'An unexpected error occurred. Please try again.';
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
