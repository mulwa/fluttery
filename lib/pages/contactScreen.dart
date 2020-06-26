import 'package:contact_manager/Bloc/contactManager.dart';
import 'package:contact_manager/pages/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  ContactManager contactManager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: <Widget>[
          Chip(
            label: StreamBuilder<int>(
              stream: contactManager.contactCount,
              builder: (context, snapshot) {
                return Text((snapshot.data ?? '0').toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold));
              }
            ),
            backgroundColor: Colors.red,
          ),
          Padding(padding: EdgeInsets.only(right: 16))
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<List<String>>(
          stream: contactManager.contactListNow,
          builder: (context, snapshot) {
            List<String> _contacts = snapshot.data;
            return ListView.separated(
                itemCount: _contacts.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(_contacts[index]),
                    leading: CircleAvatar(),
                  );
                },
                separatorBuilder: (context, index) => Divider());
          }),
    );
  }
}
