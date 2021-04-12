import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/sns_login/login_confirm.dart';

// 사용 플러그인
// flutter_core
// flutter_auth
// google login

// flutter web auth
// Uuid
// http

class Login_Home extends StatelessWidget {
  const Login_Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Firebase.initializeApp();
     return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
            child: Text("Firebase load fail"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Login_Confirm();
          }
          return CircularProgressIndicator();
        },
    );
  }
}