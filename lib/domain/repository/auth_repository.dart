import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signInWithGoogle();

  bool isSignedInWithGoogle();

  Future<bool> isUserRegistered();

  Future<bool> signOut();

  String? getCurrentSignedInEmail();
}
