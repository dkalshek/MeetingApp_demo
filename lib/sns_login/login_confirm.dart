import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/sns_login/login_main.dart';

class Login_Confirm extends StatelessWidget {
  const Login_Confirm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges(); // 로그인 확인
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) { // Snapshot으로 User 판별
          if (!snapshot.hasData) {  // 로그인 오류
            return LoginWidget();
          } else {                  // 로그인 완료
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${snapshot.data.displayName??snapshot.data.email}님 환영합니다."),
                   FlatButton( // 로그아웃 버튼
                      color: Colors.grey.withOpacity(0.3),
                      child: Text("로그아웃"),
                      onPressed: FirebaseAuth.instance.signOut,
                   )
                ],
              ),
            );
            return LoginWidget();
          }
        },
      ),
    );
  }
}
