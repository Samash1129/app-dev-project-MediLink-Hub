import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authProvider).authStateChanges();
});

final authService = Provider<AuthService>((ref) {
  return AuthService(ref); 
});

class AuthService {
  final ProviderRef ref; 

  AuthService(this.ref);

  Future<String?> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      await ref.read(authProvider).createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

      User? user = ref.read(authProvider).currentUser;
      await user?.updateDisplayName(username);

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await ref.read(authProvider).signInWithEmailAndPassword(
            email: email,
            password: password,
          );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return 'Email or password may be incorrect.';
      } else {
        return e.message;
      }
    } catch (e) {
      return 'An unexpected error occurred. Please try again.';
    }
  }

  Future<void> logout() async {
    await ref.read(authProvider).signOut();
  }
}