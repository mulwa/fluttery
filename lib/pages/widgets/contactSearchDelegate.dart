import 'package:contact_manager/model/contactModel.dart';
import 'package:flutter/material.dart';

class ContactSearchDelegate extends SearchDelegate {
  final contactManager;

  ContactSearchDelegate({this.contactManager});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query= '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.length < 3 ){
      return Center(
      child: Text("Please Enter more than Three Characters"),
      
    );
    }
    return StreamBuilder<List<Contact>>(
          stream: contactManager.filteredCollection(query:query),
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
          });
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
