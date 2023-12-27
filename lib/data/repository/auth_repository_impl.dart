import 'dart:developer';

import 'package:application_edspert/data/datasource/remote/user_remote_datasource.dart';
import 'package:application_edspert/data/repository/user_repository_impl.dart';
import 'package:application_edspert/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredentialResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredentialResult.user;
    } catch (e) {
      inspect('Err signInWithGoogle $e');
      return null;
    }
  }

  @override
  String? getCurrentSignedInEmail() {
    return FirebaseAuth.instance.currentUser?.email;
  }

  @override
  bool isSignedInWithGoogle() {
    return getCurrentSignedInEmail() != null;
  }

  @override
  Future<bool> isUserRegistered() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return false;
      }

      final userData = await UserRepositoryImpl(
        remoteDatasource: UserRemoteDatasource(client: Dio()),
      ).getUser(user.email ?? '');

      // Check if user data exists (user is registered)
      return userData != null;
    } catch (e, stackTrace) {
      inspect('Error checking user registration: $e, $stackTrace');
      return false;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e, stackTrace) {
      inspect('Error signInWithGoogle: $e, $stackTrace');
      return false;
    }
  }
}
