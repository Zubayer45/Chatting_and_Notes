import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<String> list = <String>[
  'Annual Leave',
  'Maternity/Paternity Leave',
  'Sick Leave',
  'Special Leave',
  'Study Leave',
  'Unpaid Leave',
  'Vacation Leave'
];

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  String dropdownValue = list.first;
 final TextEditingController _controller = TextEditingController();
  DateTime dateTime=DateTime.now();
  DateTime dateTime1=DateTime.now();
  void _showDatePicker(){
    showDatePicker(
     // barrierColor:  Color(0XFF32D1C6),
      
                      context: context,
                      initialDate: dateTime,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025)).then((value) {
                        setState(() {
                          dateTime=value!;
                        });
                      });
  }
  void _showDatePicker1(){
    showDatePicker(
                      context: context,
                      initialDate: dateTime,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025)).then((value) {
                        setState(() {
                          dateTime1=value!;
                        });
                      });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Date :${DateFormat.yMd().format(DateTime.now())}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(width: 1, color: Colors.grey)),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Application type :",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                Expanded(
                  child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      padding: EdgeInsets.zero,
                      iconSize: 35,
                      value: dropdownValue,
                      items:
                          list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: ((value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      })),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1,color: Colors.grey)),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  _showDatePicker();
                }, icon: const Icon(Icons.calendar_month_outlined,color:  Color(0XFF32D1C6),size: 35,)),
               Text(
                  "From :${DateFormat.yMd().format(dateTime)}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                IconButton(onPressed: (){
                  _showDatePicker1();
                }, icon: const Icon(Icons.calendar_month_outlined,color:  Color(0XFF32D1C6),size: 35,)),
               Text(
                  "To:${DateFormat.yMd().format(dateTime1)}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _controller,
            maxLines: 7,
            decoration: const InputDecoration(
              hintText: "write details",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 30,),
             Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: InkWell(
                        onTap: () {
                        
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0XFF32D1C6),
                              borderRadius: BorderRadius.circular(7)),
                          child: const Center(
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.0),
                            ),
                          ),
                        ),
                      ),
                    )
          
          
        ],
      ),
    )
    );
  }
}
