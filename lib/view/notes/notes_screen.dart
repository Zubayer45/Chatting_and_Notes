import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsm_app/provider/hive_local_database/hive_local_storage.dart';
import 'package:rsm_app/view/notes/note_card.dart';

import '../../provider/location/geolocation.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  bool selectColor = false;
  String str = '';
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool isKeyboardOpen = false;

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
   // final gelocation = Provider.of<GetLocation>(context, listen: false);
    return Consumer<HiveLocalStorage>(builder: (context, local, child) {
      return Scaffold(
        backgroundColor: Colors.amber[50],
        body: ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          itemCount: local.noteList.length + 1,
          itemBuilder: (context, index) {
            if (index == local.noteList.length) {
              return isKeyboardOpen
                  ? const SizedBox(
                      height: 70,
                    )
                  : const SizedBox(
                      height: 10,
                    );
            }
            return NoteCard(
              noteText: local.noteList[index]['noteText'],
              dateTime: local.noteList[index]['dateTime'],
             // location: local.noteList[index]['location'],
            );
          },
        ),
        bottomNavigationBar: Padding(
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

                  if (_controller.text.trim().toString().isNotEmpty) {
                    Provider.of<HiveLocalStorage>(context, listen: false)
                        .addNoteHive({
                      "noteText": _controller.text.trim(),
                      "dateTime": DateTime.now(),
                     // "location": gelocation.address
                    });
                    _controller.text = '';
                  }
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
      );
    });
  }
}
