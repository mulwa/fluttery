import 'package:contact_manager/pages/calenderScreen.dart';
import 'package:contact_manager/pages/contactScreen.dart';
import 'package:contact_manager/pages/inbox.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();

    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    super.initState();
  }

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
    _showNotificationWithDefaultSound();
    setState(() {
      _selectedIndex = value;
    });
  }

  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }

  Future _showNotificationWithDefaultSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Follower',
      'Millient followed you',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }
}
