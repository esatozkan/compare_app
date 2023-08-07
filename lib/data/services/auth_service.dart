import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compare_app/ui/view/screens/login_screen.dart';
import 'package:compare_app/ui/view/screens/main_screen.dart';
import 'package:compare_app/ui/view/widget/signup_screen_widgets/warning_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("Users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(
    BuildContext context, {
    required String name,
    required String surname,
    required String email,
    required String phone,
    required String password,
    required String instagramUserName,
    required String twitterUserName,
    required String threadsUserName,
    required String snapchatUserName,
    required String dateOfBirth,
  }) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        _registerUser(
          name: name,
          surname: surname,
          email: email,
          phone: phone,
          instagramUserName: instagramUserName,
          twitterUserName: twitterUserName,
          threadsUserName: threadsUserName,
          snapchatUserName: snapchatUserName,
          dateOfBirth: dateOfBirth,
        );
        navigator.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      warningWidget(context, e.message.toString());
    }
  }

  Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        navigator.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      warningWidget(context, e.message.toString());
    }
  }

  Future<void> _registerUser({
    required String name,
    required String surname,
    required String email,
    required String phone,
    required String instagramUserName,
    required String twitterUserName,
    required String threadsUserName,
    required String snapchatUserName,
    required String dateOfBirth,
  }) async {
    await userCollection.doc().set(
      {
        "User name": name,
        "User Surname": surname,
        "User e-mail": email,
        "User phone": phone,
        "User instagram name": instagramUserName,
        "User twitter name": twitterUserName,
        "User threads name": threadsUserName,
        "User snapchat name": snapchatUserName,
        "User date of birth": dateOfBirth,
      },
    );
  }
}
