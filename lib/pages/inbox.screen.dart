import 'package:contact_manager/pages/messageList.dart';
import 'package:contact_manager/pages/widgets/drawer.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Inbox"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    print('something was implemented');
                  })
            ],
            bottom: TabBar(tabs: <Widget>[
              Tab(
                text: "Important",
                icon: Icon(Icons.people),
              ),
              Tab(
                text: "Another",
                icon: Icon(Icons.account_balance_wallet),
              )
            ]),
          ),
          drawer: AppDrawer(),
          body: TabBarView(children: <Widget>[
            Center(
              child: Text("Important"),
            ),
            MessageList()
          ])),
      length: 2,
    );
  }
}
