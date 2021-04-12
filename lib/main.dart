import 'package:flutter/material.dart';
import 'package:login/push_alarm/controller/abNoti.dart';
import 'package:login/push_alarm/controller/alarm_noti.dart';

void main() => runApp(MaterialApp(home: alarms(), ));

class alarms extends StatefulWidget {
  @override
  _AlarmsState createState() => _AlarmsState();
}

class _AlarmsState extends State<alarms> {

  Noti noti = AlarmNoti();

  @override
  void initState() {
    Future(noti.init);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: TextButton(
        child: Text("Local Notifications Show!"),
        onPressed: () async => await noti.show(),
      ),
    ),
  );
}

/*
import 'package:flutter/material.dart';

import 'package:login/screens/welcome_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/registration_screen.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/location/location_home.dart';
//import 'package:login/screens/chat_screen.dart';

void main() => runApp(MeetingApp());

class MeetingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith( // copyWith(): 다 복사해오되, ()안의 것만 달라지는 것들이 쓰면 좋음
      //   textTheme: TextTheme(
      //     body1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      //home: WelcomeScreen(),
      initialRoute: '/home',
      routes: {
        '/': (context) => WelcomeScreen(), // 그냥 슬래시(/)는 반드시 하나 있어야 한다.
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(),
        //'/Recommend': (context) => RecommendScreen(),
        '/location': (context) => LocationScreen(),
        //'/like': (context) => LikeScreen(),
        //'/chat': (context) => ChatScreen(),
        //'/mypage': (context) => MypageScreen(),
      },
    );
  }
}
 */