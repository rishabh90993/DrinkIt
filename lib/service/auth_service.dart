import 'package:drink_it/Models/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential = await auth.signInWithCredential(credential);
        user = userCredential.user;
        UserDetails userDetails = UserDetails(
            name: user?.displayName ?? "",
            email: user?.email ?? "",
            uid: user?.uid ?? "",
            photoUrl: user?.photoURL ?? ""
        );
      userDetails.saveUserDetails();
      } on FirebaseAuthException catch (e) {
        print("Error==> ${e}");
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }


  static Future<void> logoutUser() async {
    await FirebaseAuth.instance.signOut();
    final _pref = await SharedPreferences.getInstance();
    _pref.clear();
  }
}