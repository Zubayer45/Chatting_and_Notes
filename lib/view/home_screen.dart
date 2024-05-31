import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsm_app/provider/internet_check/is_active.dart';
import 'package:rsm_app/view/Attendece/attendence_screen.dart';
import 'package:rsm_app/view/chat/chat_screen.dart';
import 'package:rsm_app/view/drawer_screen.dart';
import 'package:rsm_app/view/notes/notes_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length:3, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  //  var internetStatus = Provider.of<NetworkStatus>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0XFF32D1C6),
        title: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Chats & Notes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade100,
                ),
              ),
              SizedBox(
                width: 100,
                child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text(
                              "online",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade100,
                              ),
                            )
                          ,
                      const SizedBox(
                        width: 3,
                      ),
                      CircleAvatar(
                          radius: 5,
                          backgroundColor:
                              
                                   const Color.fromARGB(255, 3, 168, 14)
                                )
                    ]),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade100,
              )),
          PopupMenuButton(
              iconColor: Colors.white,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: "Settitngs",
                    child: Text("Settitngs"),
                  ),
                  const PopupMenuItem(
                    value: "Create group",
                    child: Text("Create group"),
                  ),
                  const PopupMenuItem(
                    value: "Settitngs",
                    child: Text("Settitngs"),
                  ),
                  const PopupMenuItem(
                    value: "Settitngs",
                    child: Text("Settitngs"),
                  ),
                ];
              })
        ],
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorWeight: .2,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 2),
            tabs: const [
              Tab(child: Text("Chats")),
              Tab(child: Text("Notes")),
               Tab(child: Text("Attendece")),
            ]),
      ),
      body: TabBarView(controller: _tabController, children: const [
        ChatScreen(),
        NotesScreen(),
        AttendenceScreen()
      ]),
      drawer: const DrawerScreen(),
    );
  }
}

