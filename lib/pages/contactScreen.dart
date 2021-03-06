import 'package:contact_manager/Bloc/contactManager.dart';
import 'package:contact_manager/Bloc/provider.dart';
import 'package:contact_manager/model/contactModel.dart';
import 'package:contact_manager/pages/widgets/contactCounter.dart';
import 'package:contact_manager/pages/widgets/contactSearchDelegate.dart';
import 'package:contact_manager/pages/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  // ContactManager contactManager = ContactManager();
  @override
  Widget build(BuildContext context) {
    ContactManager contactManager = ContactProvider.of(context).data;
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: <Widget>[
          Chip(
            label: ContactCounter(),
            backgroundColor: Colors.red,
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: ContactSearchDelegate(contactManager: contactManager));
              }),
          Padding(padding: EdgeInsets.only(right: 16))
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<List<Contact>>(
          stream: contactManager.contactListNow,
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
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
