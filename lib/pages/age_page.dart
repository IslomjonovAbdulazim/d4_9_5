import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  DateTime? selectedTime;
  DateTime now = DateTime.now();
  String formattedDate = "No Date Selected";
  int years = 0;
  int months = 0;
  int weeks = 0;
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  int milliseconds = 0;
  int microseconds = 0;

  void calculate() {
    if (selectedTime == null) return;
    now = DateTime.now();
    final diff = now.difference(selectedTime!);
    years = diff.inDays ~/ 365;
    months = diff.inDays ~/ 30;
    weeks = diff.inDays ~/ 7;
    days = diff.inDays;
    hours = diff.inHours;
    minutes = diff.inMinutes;
    seconds = diff.inSeconds;
    milliseconds = diff.inMilliseconds;
    microseconds = diff.inMicroseconds;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Text("Age Info"),
                CupertinoButton(
                  onPressed: () async {
                    selectedTime = await showDatePicker(
                      context: context,
                      firstDate:
                          DateTime.now().subtract(Duration(days: 365 * 200)),
                      lastDate: DateTime.now(),
                    );
                    if (selectedTime == null) {
                      formattedDate = "No Date Selected";
                    } else {
                      formattedDate = DateFormat.yMMMd().format(selectedTime!);
                    }
                    setState(() {});
                    calculate();
                  },
                  child: Text("Selected Date: $formattedDate"),
                ),
                Row(
                  children: [
                    Text(formattedDate),
                    SizedBox(width: 10),
                    Expanded(child: Divider()),
                    SizedBox(width: 10),
                    Text(DateFormat.yMMMd().format(now)),
                  ],
                ),
                SizedBox(height: 40),
                Text("Years : $years"),
                Text("Months: $months"),
                Text("Weeks: $weeks"),
                Text("Days: $days"),
                Text("Hours: ${NumberFormat("#,###").format(hours)}"),
                Text("Minutes: ${NumberFormat("#,###").format(minutes)}"),
                Text("Seconds: ${NumberFormat("#,###").format(seconds)}"),
                Text("Milliseconds: ${NumberFormat("#,###").format(milliseconds)}"),
                Text("Microseconds: ${NumberFormat("#,###").format(microseconds)}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
