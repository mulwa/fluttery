import 'dart:convert';

import 'package:contact_manager/model/contactModel.dart';
import 'package:http/http.dart' as http;
class ContactService {
  static String _url ="https://jsonplaceholder.typicode.com/users";
  static Future browse () async{
    http.Response res  = await http.get(_url);
    List collection = json.decode(res.body);
  List<Contact> _contacts = collection.map((json) => Contact.fromJson(json)).toList();
  return _contacts;
    

  }
}