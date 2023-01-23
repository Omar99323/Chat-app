import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/consts.dart';
import 'package:scholar_chat/message.dart';
import 'package:scholar_chat/pages/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/pages/chat_cubit/chat_state.dart';
import 'package:scholar_chat/widgets/chat_bubble.dart';
import 'package:scholar_chat/widgets/chat_field.dart';

// ignore: must_be_immutable
class Thechat extends StatelessWidget {
  Thechat({Key? key}) : super(key: key);
  static String id = 'Chat';
  List<Message> mlist = [];
  TextEditingController cont = TextEditingController();
  ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              height: 60,
            ),
            const Text('Chat'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              if (state is ChatSuccess) {
                mlist = state.msglist;
              }
              BlocProvider.of<ChatCubit>(context).showMessages();
            },
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: scroll,
                  itemCount: mlist.length,
                  itemBuilder: (context, index) {
                    return mlist[index].id == email
                        ? Bubble(
                            msg: mlist[index],
                          )
                        : Bubble2(msg: mlist[index]);
                  },
                ),
              );
            },
          ),
          ChatField(
            txtcontroller: cont,
            ons: (data) {
              BlocProvider.of<ChatCubit>(context)
                  .sendMessage(message: data, email: email.toString());
              cont.clear();
              scroll.jumpTo(
                scroll.position.minScrollExtent,
              );
            },
          ),
        ],
      ),
    );
  }
}
