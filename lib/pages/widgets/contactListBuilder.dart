import 'package:contact_manager/model/contactModel.dart';
import 'package:flutter/material.dart';

class ContactListBuilder extends StatelessWidget {
  final Stream<List<Contact>> stream;
  final Function builder;

  const ContactListBuilder({this.stream, this.builder});

  @override
  Widget build(BuildContext context) {
    StreamBuilder<List<Contact>>(
        stream: this.stream,
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              List<Contact> _contacts = snapshot.data;
              return this.builder(context, _contacts);
          }
        });
  }
}
