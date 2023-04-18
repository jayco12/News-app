import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationClient {
  FirebaseAuth auth = FirebaseAuth.instance;

  registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;

    try {
      final UserCredential userCendential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCendential.user;
      await user!.updateDisplayName(name);
      user = auth.currentUser;
    } catch (e) {
      if (e.toString().compareTo(
              '[firebase_auth/email-already-in-use] The email address is already in use by another account.') ==
          0) {
        showError(BuildContext context, Object errormessage) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Note'),
                  content: Text(errormessage.toString()),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'))
                  ],
                );
              });
        }

        log(e.toString());
      }
    }

    return user;
  }

  showError(BuildContext context, Object errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Note'),
            content: Text(errormessage.toString()),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    User? user;

    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      return user;
    } catch (e) {
      showError(
        context,
        'user not found, check details again',
      );
    }
  }

  logoutUser() async {
    await auth.signOut();
  }
}
