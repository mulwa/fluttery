import 'package:contact_manager/Bloc/contactManager.dart';
import 'package:flutter/material.dart';

class ContactProvider extends InheritedWidget{
  final ContactManager data;

  ContactProvider({Key key, Widget child, this.data}):super(key:key, child:child);

  static ContactProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ContactProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

}