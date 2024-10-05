import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruity/core/errors/custom_exceptions.dart';

class FirebaseAuthService {
  // Method to create a user with email and password (Sign up)
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthException(e, method: 'signup');
    } catch (e) {
      throw CustomExceptions(
          message: 'An unexpected error occurred. Please try again.');
    }
  }

  // Method to sign in with email and password
  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthException(e, method: 'signin');
    } catch (e) {
      throw CustomExceptions(
          message: 'An unexpected error occurred. Please try again.');
    }
  }

  // Method to sign out the user
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthException(e, method: 'signout');
    } catch (e) {
      throw CustomExceptions(
          message: 'An unexpected error occurred while signing out.');
    }
  }

  // Private method for centralized error handling based on the method type (signup, signin, signout)
  CustomExceptions _handleFirebaseAuthException(FirebaseAuthException e,
      {required String method}) {
    switch (method) {
      case 'signup':
        switch (e.code) {
          case 'weak-password':
            return CustomExceptions(
                message: 'The password provided is too weak.');
          case 'email-already-in-use':
            return CustomExceptions(
                message: 'The account already exists for that email.');
          case 'invalid-email':
            return CustomExceptions(
                message: 'The email address provided is not valid.');
          default:
            return CustomExceptions(
                message: 'Error creating the account. Try again.');
        }
      case 'signin':
        switch (e.code) {
          case 'user-not-found':
            return CustomExceptions(message: 'No user found for that email.');
          case 'wrong-password':
            return CustomExceptions(message: 'Incorrect password.');
          case 'invalid-email':
            return CustomExceptions(message: 'Invalid email address.');
          case 'too-many-requests':
            return CustomExceptions(
                message: 'Too many login attempts. Try again later.');
          default:
            return CustomExceptions(message: 'Error signing in. Try again.');
        }
      case 'signout':
        return CustomExceptions(
            message: 'An error occurred while signing out.');
      default:
        return CustomExceptions(message: 'An unknown error occurred.');
    }
  }
}
