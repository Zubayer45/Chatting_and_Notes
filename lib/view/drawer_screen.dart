import 'package:flutter/material.dart';
import 'package:rsm_app/view/about.dart';
import 'package:rsm_app/view/leave_application/leave_screen.dart';
import 'package:rsm_app/view/report_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: Colors.white,
      child: ListView(children:  [const UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Colors.white),
        currentAccountPicture: CircleAvatar(child: Icon(Icons.person,color: Colors.white,)),
        accountName: Text("Name"), accountEmail: Text("name@gmail.com")),

        ListTile(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const LeaveScreen()));},
          leading: const Icon(Icons.edit_document,size: 30,color: Colors.grey,),title: const Text("Leave Application",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
          ListTile(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context) => const ReportScreen(),));},
            leading: const Icon(Icons.report_outlined,size: 30,),title: const Text("Report",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
        ListTile(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutScreen()));},
          leading: const Icon(Icons.info_outline,size: 30,),title: const Text("About",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
        const ListTile(leading: Icon(Icons.logout,size: 30,),title: Text("Log out",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),),
        ],),
    );
  }
}
