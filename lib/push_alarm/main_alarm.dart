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