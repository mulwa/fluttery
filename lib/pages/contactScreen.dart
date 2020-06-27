import 'package:contact_manager/Bloc/contactManager.dart';
import 'package:contact_manager/model/contactModel.dart';
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
                }),
            backgroundColor: Colors.red,
          ),

          IconButton(icon: Icon(Icons.search), onPressed: (){
            print('Searching');
          }),

          Padding(padding: EdgeInsets.only(right: 16))
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<List<Contact>>(
          stream: contactManager.contactListNow,
          builder:(BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                List<Contact> _contacts = snapshot.data;
                return ListView.separated(
                    itemCount: _contacts?.length ?? 0,
                    itemBuilder: (BuildContext context, index) {
                      Contact _contact = _contacts[index];
                      return ListTile(
                        title: Text(_contact.name),
                        subtitle: Text(_contact.email),
                        leading: CircleAvatar(),
                      );
                    },
                    separatorBuilder: (context, index) => Divider());
            }
          }),
    );
  }
}
