import 'package:flutter/material.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            elevation: 8,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Date :14/02/2024',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Application type:Sick Leave',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'From 15/02/2024 To 20/02/2024\n',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "I am writing to you to let you know that I have an important personal matter to attend at my hometown due to which I will not be able to come to the office from {start date} to {end date}.I have discussed and delegated my tasks to {person's name} & have instructed them to call me for any help during my absence.I will be obliged if you consider my application for approval.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
