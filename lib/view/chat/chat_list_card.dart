import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rsm_app/models/chat_model.dart';
import 'package:rsm_app/view/individual_chat/individual_chat_screen.dart';

class ChatListCard extends StatelessWidget {
  final ChatModel chatModel;
  const ChatListCard({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IndividualChatScrren(
                chatModel: chatModel,
              ),
            ));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey.shade200,
              child: const Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
            ),
            title: Text(
              chatModel.name!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all,
                  size: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  chatModel.currentMessage!,
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
            trailing: Text(DateFormat.jm().format(chatModel.dateTime!)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 85.0, right: 20),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey.shade300,
            ),
          )
        ],
      ),
    );
  }
}
