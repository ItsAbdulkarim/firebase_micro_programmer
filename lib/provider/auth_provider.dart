import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> signUp(String email, String password) async {
    String response = '';

    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        response = 'user register successfully';
      },
    ).catchError((e) {
      response = '$e';
    });

    return response;
  }

  Future<String> signIn(String email, String password) async {
    String response = '';

    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      response = 'User login successfully';
    }).catchError((e) {
      response = '$e';
    });

    return response;
  }

//or both create  through try and catch eg same is sign

  /*
  Future<String> registerUser(String email, String password) async {
    String response = '';

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      response = 'User Registered Successfully';
    } catch (e) {
      response = '$e';
    }

    return response;
  }




   */
}
