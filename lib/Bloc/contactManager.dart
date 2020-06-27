import 'dart:async';

import 'package:contact_manager/model/contactModel.dart';
import 'package:contact_manager/services/contactService.dart';

List<String> CONTACTS = ["User One", "User Two","User thre3", "User4"];
class ContactManager {
  Stream<List<Contact>> get contactListNow async*{
    yield await ContactService.browse();
  }
  final StreamController<int> _contactsStream = StreamController<int>();
  Stream<int> get contactCount => _contactsStream.stream;

  ContactManager(){
    contactListNow.listen((contact) {
      _contactsStream.add(contact.length);

     });
  }
}