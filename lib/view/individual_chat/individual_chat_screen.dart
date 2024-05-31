import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rsm_app/models/chat_model.dart';
import 'package:rsm_app/provider/hive_local_database/hive_local_storage.dart';
import 'package:rsm_app/provider/internet_check/is_active.dart';
import 'package:rsm_app/view/individual_chat/own_message.dart';
import 'package:rsm_app/view/individual_chat/reply_message_card.dart';

class IndividualChatScrren extends StatefulWidget {
  final ChatModel chatModel;
  const IndividualChatScrren({super.key, required this.chatModel});

  @override
  State<IndividualChatScrren> createState() => _IndividualChatScrrenState();
}

class _IndividualChatScrrenState extends State<IndividualChatScrren> {
  bool selectColor = false;
  String str = '';
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool isKeyboardOpen = false;
  int itemLenth = 100;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // refreshLocalData(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
    _focusNode.addListener(_onFocusChange);

    super.initState();
  }

  void _onFocusChange() {
    setState(() {
      isKeyboardOpen = _focusNode.hasFocus;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  refreshLocalData(BuildContext context) async {
    Provider.of<HiveLocalStorage>(context, listen: false).refreshData();
    await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    //var internetStatus = Provider.of<NetworkStatus>(context);
    return Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          backgroundColor: const Color(0XFF32D1C6),
          leadingWidth: 90,
          leading: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: CircleAvatar(
                backgroundColor: Colors.blueGrey.shade300,
                radius: 25,
                child: widget.chatModel.isGroup!
                    ? SvgPicture.asset(
                        widget.chatModel.icon!,
                        height: 35,
                        width: 35,
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        widget.chatModel.icon!,
                        height: 35,
                        width: 35,
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      ),
              )),
            ],
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatModel.name!,
                style: const TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              
                 const Text("online",
                      style: TextStyle(fontSize: 11, color: Colors.white))
                  // : const Text(
                  //     "last seen today at 5:52 PM",
                  //     style: TextStyle(fontSize: 11, color: Colors.white),
                  //   )
            ],
          ),
          actions: [
            PopupMenuButton(
                iconColor: Colors.white,
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: "View contact",
                      child: Text("View contact"),
                    ),
                    const PopupMenuItem(
                      value: "View contact",
                      child: Text("View contact"),
                    ),
                    const PopupMenuItem(
                      value: "View contact",
                      child: Text("View contact"),
                    ),
                    const PopupMenuItem(
                      value: "View contact",
                      child: Text("View contact"),
                    ),
                    const PopupMenuItem(
                      value: "View contact",
                      child: Text("View contact"),
                    ),
                  ];
                })
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: itemLenth,
              itemBuilder: (context, index) {
                if (index == 100) {
                  return isKeyboardOpen
                      ? const SizedBox(
                          height: 70,
                        )
                      : const SizedBox(
                          height: 10,
                        );
                }
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      OwnMessageCared(message: "hello"),
                      ReplyMessageCard(),
                    ],
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          controller: _controller,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: "Write description",
                            contentPadding: EdgeInsets.only(
                                left: 20, right: 10, top: 10, bottom: 10),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.bounceIn);
                        _controller.text = '';

                        // if (_controller.text.trim().toString().isNotEmpty) {
                        //   Provider.of<HiveLocalStorage>(context, listen: false)
                        //       .addNoteHive({
                        //     "noteText": _controller.text.trim(),
                        //     "dateTime": DateTime.now(),
                        //     "location": 'location'
                        //   });
                        //   _controller.text = '';
                        // }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Color(0XFF32D1C6), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: null);
  }
}
