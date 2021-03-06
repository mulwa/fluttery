import 'dart:async';

import 'package:contact_manager/model/contactModel.dart';
import 'package:contact_manager/services/contactService.dart';
import 'package:rxdart/rxdart.dart';

List<String> CONTACTS = ["User One", "User Two","User thre3", "User4"];
class ContactManager {
  Stream<List<Contact>> get contactListNow async* {
    yield  await ContactService.browse();
  }
  // Stream<List<Contact>> filteredCollection({query}) => Stream.fromFuture(ContactService.browse(query:query)) ;
  Stream<List<Contact>> filteredCollection({query}) async*{
   yield await ContactService.browse(query:query) ;

  } 
  
  final BehaviorSubject<int> _contactsStream = BehaviorSubject<int>();
  Stream<int> get contactCount => _contactsStream.stream;

  ContactManager(){
    contactListNow.listen((contact) {
      _contactsStream.add(contact.length);

     });
  }
}