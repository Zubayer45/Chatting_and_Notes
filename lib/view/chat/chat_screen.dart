import 'package:flutter/material.dart';
import 'package:rsm_app/models/chat_model.dart';
import 'package:rsm_app/view/chat/chat_list_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> chatList = [
    ChatModel(
        name: "Techno Art",
        isGroup: true,
        icon: "assets/icons/groups.svg",
        dateTime: DateTime.now(),
        currentMessage: "Hey there."),
    ChatModel(
        name: "Tonmy",
        isGroup: false,
        icon: "assets/icons/person.svg",
        dateTime: DateTime.now(),
        currentMessage: "Hi there."),
    ChatModel(
        name: "Tanvir",
        isGroup: false,
        icon: "assets/icons/person.svg",
        dateTime: DateTime.now(),
        currentMessage: "Hi there."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            return ChatListCard(
              chatModel: chatList[index],
            );
          }),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0XFF32D1C6),
      //   // elevation: 0,
      //   shape: const CircleBorder(),
      //   onPressed: () {},
      //   child: const Icon(Icons.chat, color: Colors.white),
      // ),
    );
  }
}
