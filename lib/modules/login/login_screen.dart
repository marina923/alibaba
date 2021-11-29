import 'package:amlak/modules/main/MainScreen.dart';
import 'package:amlak/shared/components/resources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LogInScreen extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  String userEmail = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200.0,
          height: 70.0,
          child: SignInButton(Buttons.Facebook, onPressed: () async {
            await signInWithFacebook();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MainScreen()));
          }),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile', 'user_birthday'],
    );

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    final userData = await FacebookAuth.instance.getUserData();
    userEmail = userData['email'];
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
