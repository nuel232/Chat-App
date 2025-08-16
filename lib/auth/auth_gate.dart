import 'package:chat_app/auth/loginOrRegister.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//this will use a stream builder that will listen ot any auth state changes

//In other words this will get weather the user is login or not
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in - return the home page
          if (snapshot.hasData) {
            return const HomePage();
          }
          //user is Not logged in
          else {
            return const loginOrRegister();
          }
        },
      ),
    );
  }
}
