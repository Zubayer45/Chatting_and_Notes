import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: const Color(0XFF32D1C6),
        title: const Text('Report',style: TextStyle(color: Colors.white),),
      ),
      body: Center(child: Text("Under Construction"),),);
  }
}