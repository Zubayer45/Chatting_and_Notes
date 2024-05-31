// ignore_for_file: unused_element, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({super.key});

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  bool inOffice = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    DateTime now = DateTime.now();
    DateTime tenAM = DateTime(now.year, now.month, now.day, 10, 0);
    DateTime tenPM = DateTime(now.year, now.month, now.day, 19, 0);
    bool isAfter10AM = now.isAfter(tenAM);
    // ignore: unused_local_variable
    bool isBefore7PM = now.isBefore(tenPM);
    DateTime selectedDate = DateTime.now();
    showDatepicker() {
      showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(1900),
              lastDate: DateTime(3000))
          .then((value) {
        setState(() {
          selectedDate = value!;
        });
      });
    }

    return Scaffold(
      //backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                inOffice
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            inOffice = false;
                            isAfter10AM = true;
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0XFF32D1C6),
                                borderRadius: BorderRadius.circular(25)),
                            width: screenWidth * 0.35,
                            height: screenHeight * 0.06,
                            child: const Center(
                                child: Text(
                              "In office",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ))),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            inOffice = true;
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                            width: screenWidth * 0.35,
                            height: screenHeight * 0.06,
                            child: const Center(
                                child: Text(
                              "Out office",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ))),
                      ),
                const SizedBox(
                  width: 10,
                ),
                isAfter10AM
                    ? Expanded(
                        child: TextFormField(
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "write late reason",
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey)),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // height: screenHeight * 0.09,
              //decoration: const BoxDecoration(color: Colors.red),
              child: const Row(
                children: [
                  // IconButton(
                  //     onPressed: ()  {
                  //        showDatepicker();
                  //     },
                  //     icon: const Icon(
                  //       Icons.calendar_month_rounded,
                  //       color: Colors.greenAccent,
                  //       size: 30,
                  //     )),

                  //
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Table(
                    border: TableBorder.all(width: 0.4),
                    columnWidths: <int, TableColumnWidth>{
                      0: FixedColumnWidth(screenWidth * 0.05),
                      1: const FixedColumnWidth(1),
                      2: const FixedColumnWidth(1),
                      3: FixedColumnWidth(screenWidth * 0.07),
                    },
                    children: const [
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("In time",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("out time",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Remarks",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                      ]),
                    ],
                  );
                }
                return Table(
                  border: TableBorder.all(width: 0.4),
                  columnWidths: <int, TableColumnWidth>{
                    0: FixedColumnWidth(screenWidth * 0.05),
                    1: const FixedColumnWidth(1),
                    2: const FixedColumnWidth(1),
                    3: FixedColumnWidth(screenWidth * 0.07),
                  },
                  children: [
                    TableRow(children: [
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          DateFormat.yMEd().format(DateTime.now()),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                        DateFormat.jm().format(DateTime.now() ),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "07:00 PM",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 1, color: Colors.teal)),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        title: const Text("Remark"),
                                        content: const SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Late in office reason:",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                                "Late In office reason out remarksUpload your bundle to Google Play to test it. You can use the internal test track, or the alpha or beta channels to test the bundle before releasing it in productio.",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w100,
                                                    color: Colors.black),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Divider(),
                                              ),
                                              Text(
                                                "Early out office reason:",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                                  "Out office reason:Two games before that lopsided result, Virginia rallied from an 11-point deficit in the second half and held off a late surge to secure a 64-62 victory over the Yellow Jackets at John Paul Jones Arena in Charlottesville")
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ))
                                            ],
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "view rmks",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
