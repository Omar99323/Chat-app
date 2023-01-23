import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/message.dart';
import 'package:scholar_chat/pages/chat_cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  void sendMessage({required String message, required String email}) {
    messages
        .add({'message': message, 'createdat': DateTime.now(), 'id': email});
  }

  void showMessages() {
    messages.orderBy('createdat', descending: true).snapshots().listen((event) {
      List<Message> msglist = [];

      for (var doc in event.docs) {
        msglist.add(Message.fromjson(doc));
      }
      emit(ChatSuccess(msglist: msglist));
    });
  }
}
