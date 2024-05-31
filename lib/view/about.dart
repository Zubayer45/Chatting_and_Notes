import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: const Color(0XFF32D1C6),
        title: const Text('About',style: TextStyle(color: Colors.white),),
      ),
      body: Center(child: Text("Under Construction"),),);
  }
}