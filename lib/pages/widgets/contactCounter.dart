import 'package:contact_manager/Bloc/contactManager.dart';
import 'package:contact_manager/Bloc/provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager contactManager = ContactProvider.of(context).data;

    return StreamBuilder<int>(
        stream: contactManager.contactCount,
        builder: (context, snapshot) {
          return Text((snapshot.data ?? '0').toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
        });
  }
}
