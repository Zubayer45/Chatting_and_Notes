import 'package:flutter/material.dart';
import 'package:rsm_app/view/leave_application/application_screen.dart';
import 'package:rsm_app/view/leave_application/pending_screen.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: const Color(0XFF32D1C6),
        title: const Text(
          'Leave Application',
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          isScrollable: true,
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorWeight: .1,
            dividerColor: Colors.amberAccent,

            indicatorPadding: const EdgeInsets.symmetric(horizontal: 2),
            tabs: const [
              Tab(child: Text("Apply",style: TextStyle(fontSize: 14),)),
              Tab(child: Text("Pending")),
              Tab(child: Text("Approved")),
              Tab(child: Text("Reject")),
              Tab(child: Text("Details")),
            ]),
      ),
      body:TabBarView(
        controller: _tabController,
        children: const [
       ApplicationScreen(),
       PendingScreen(),
        Center(child: Text("Approved")),
        Center(child: Text("Reject")),
        Center(child: Text("Details")),
      ],)
      
      
    );
  }
}
