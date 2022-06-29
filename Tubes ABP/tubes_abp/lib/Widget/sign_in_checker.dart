import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/login.dart';
import 'package:tubes_abp/main.dart';

class signInChecker extends StatelessWidget {
  const signInChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?> (
      stream : FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Something Went Wrong"));
        } else if (snapshot.hasError) {
          return MyHomePage(title: 'El-Puppy Store');
        } else if (snapshot.hasData) {
          return MyHomePage(title: 'El-Puppy Store');
        } else {
          return Login();
        }   
      },
    )
   );
}