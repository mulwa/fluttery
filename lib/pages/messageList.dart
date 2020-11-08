import 'dart:convert';

import 'package:contact_manager/model/message.dart';
import 'package:contact_manager/pages/messageDetails.dart';
import 'package:contact_manager/pages/widgets/composeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;

  MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = [];

  Future loadMessageList() async {
    var content = await rootBundle.loadString('lib/data/messages.json');
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();
    setState(() {
      this.messages = _messages;
    });
    print(content);
  }

  @override
  void initState() {
    loadMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          Message message = this.messages[index];
          return ListTile(
            isThreeLine: true,
            title: Text(message.subject),
            leading: CircleAvatar(
              child: Text('PH'),
            ),
            subtitle: Text(
              message.body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MessageDetail(
                            title: message.subject,
                            body: message.body,
                          )));
            },
          );
        });
    // floatingActionButton: ComposeButton(),
  }
}
