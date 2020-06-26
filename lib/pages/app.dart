import 'package:contact_manager/pages/calenderScreen.dart';
import 'package:contact_manager/pages/contactScreen.dart';
import 'package:contact_manager/pages/inbox.screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [InboxScreen(), ContactsScreen(), CalenderScreen()]
          .elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text("Inbox"), icon: Icon(Icons.mail)),
          BottomNavigationBarItem(
              title: Text("Contacts"), icon: Icon(Icons.people)),
          BottomNavigationBarItem(
              title: Text("Calender"), icon: Icon(Icons.calendar_today)),
        ],
        onTap: _onBarItemTap,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
