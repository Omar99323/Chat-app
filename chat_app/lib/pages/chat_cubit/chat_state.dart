import 'package:scholar_chat/message.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState {
  List<Message> msglist;
  ChatSuccess({required this.msglist});
}
