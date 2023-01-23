class Message {
  String message;
  String id;
  Message(this.message,this.id);

  factory Message.fromjson(mdata) {
    return Message(mdata['message'], mdata['id']);
  }
}
