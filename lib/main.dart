import 'package:contact_manager/Bloc/provider.dart';
import 'package:contact_manager/pages/app.dart';
import 'package:contact_manager/pages/messageList.dart';
import 'package:flutter/material.dart';

import 'Bloc/contactManager.dart';

void main() {
  runApp(EmailApp());
}

class EmailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ContactProvider(
          data: ContactManager(),
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(        
          primarySwatch: Colors.indigo,        
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: App(),
      ),
    );
  }
}



