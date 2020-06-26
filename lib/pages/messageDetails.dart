import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  final String title;
  final String body;

  const MessageDetail({Key key, this.title, this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(this.body)),
      ),
    );
  }
}
