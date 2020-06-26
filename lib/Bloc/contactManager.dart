import 'dart:async';

List<String> CONTACTS = ["User One", "User Two","User thre3", "User4"];
class ContactManager {
  Stream<List<String>> get contactListNow async*{
    for(var i =0; i < CONTACTS.length; i++){
      await Future.delayed(Duration(seconds:2));
      yield CONTACTS.sublist(0, i+1);
      
    }
  }
  final StreamController<int> _contactsStream = StreamController<int>();
  Stream<int> get contactCount => _contactsStream.stream;

  ContactManager(){
    contactListNow.listen((contact) {
      _contactsStream.add(contact.length);

     });
  }
}