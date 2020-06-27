import 'dart:convert';

import 'package:contact_manager/model/contactModel.dart';
import 'package:http/http.dart' as http;
class ContactService {
  static String _url ="https://jsonplaceholder.typicode.com/users";
  static Future browse ({query}) async{
    http.Response res  = await http.get(_url);
    List collection = json.decode(res.body);
  Iterable<Contact> _contacts = collection.map((json) => Contact.fromJson(json));
  if(query != null && query.isNotEmpty){
    _contacts = _contacts.where((contact) => contact.name.toLowerCase().contains(query));
  }
  return _contacts.toList();
    

  }
}