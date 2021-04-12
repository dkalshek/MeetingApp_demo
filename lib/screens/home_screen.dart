import 'package:flutter/material.dart';
import 'package:login/location/location_home.dart';
import 'package:login/screens/imagerank_screen.dart';
//import 'package:login/screens/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { // BottomNavIcon 구성
    int _selectedIndex = 0;
    List<Widget> _widgetOptions = <Widget>[
    Text('Index 1: Recommend'),
    LocationScreen(),
    ImageRankScreen(),
    Text('Index 4: chat',),//ChatScreen(),
    Text('Index 5: my page',),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const<BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.recommend, color: Colors.redAccent),
                title: Text('Recommend', style: TextStyle(color: Colors.redAccent),)
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on, color: Colors.redAccent),
                title: Text('Location', style: TextStyle(color: Colors.redAccent),)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.redAccent),
                title: Text('Heart', style: TextStyle(color: Colors.redAccent),)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.forum, color: Colors.redAccent),
                title: Text('Chatting', style: TextStyle(color: Colors.redAccent),)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, color: Colors.redAccent),
                title: Text('My page', style: TextStyle(color: Colors.redAccent),)
              ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
      ),
    );
  }
}