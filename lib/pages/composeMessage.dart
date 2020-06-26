import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Message"),
      ),
      body: Center(
        child: Text("Compose Message"),
      ),
    );
  }
}
