import 'package:contact_manager/pages/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CalenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calander"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Calender"),
      ),
    );
  }
}
