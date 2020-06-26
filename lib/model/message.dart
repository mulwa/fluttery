class Message {
  String subject;
  String body;

  Message({this.body, this.subject});

  Message.fromJson(Map<String, dynamic> json)
      : subject = json['subject'],
        body = json['body'];
}

// flutter packages pub run build_runner build
