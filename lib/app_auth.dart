import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/custom_text.dart';

import 'homenavigation.dart';

class AppAuth {
  static Future RegisterUser(
      {required String mail,
      required String pass,
      required String name,
      required String phone,
      required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: mail,
        password: pass,
      )
          .then((value) {
        if (value.user != null) {
          SaveNewUserToDB(
              mail: mail,
              pass: pass,
              uid: value.user!.uid,
              name: name,
              phone: phone);

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => homenav()),
              (route) => false);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }

  //!=======================================================================

  static Future SignInUser(
      {required String mail,
      required String pass,
      required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: pass)
          .then((value) {
        if (value.user != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => homenav()),
              (route) => false);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: CustomText(data: "User Logged In Successfully"),
            backgroundColor: Colors.green,
          ));
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomText(data: "Check Your Credentials and try again!!"),
          backgroundColor: Colors.red,
        ));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomText(data: "Check Your Credentials and try again!!"),
          backgroundColor: Colors.red,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomText(data: "Check Your Credentials and try again!!"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  //!=====================================================================

  static Future<void> SaveNewUserToDB({
    required String mail,
    required String pass,
    required String uid,
    required String name,
    required String phone,
  }) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      "Name": name,
      "Email": mail,
      "Pass": pass,
      "Phone": phone,
      "UID": uid,
    });
  }
}
