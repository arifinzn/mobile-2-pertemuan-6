import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PertamaPage extends StatefulWidget {
  const PertamaPage({super.key});

  @override
  State<PertamaPage> createState() => _PertamaPageState();
}

class _PertamaPageState extends State<PertamaPage> {
  DateTime? dateTimeNow = DateTime.now(), dateTimeTomorrow, pickedDate;
  TimeOfDay? pickedTime, selectedTime = TimeOfDay.now();
  var year, month, date;

  Future getDate(BuildContext context) async {
    pickedDate = await showDatePicker(
        context: context,
        initialDate: dateTimeNow!,
        firstDate: DateTime(dateTimeNow!.year - 1),
        lastDate: DateTime(dateTimeNow!.year + 1));
    if (pickedDate != null && pickedDate != dateTimeNow) {
      setState(() {
        dateTimeNow = pickedDate;
      });
    }
  }

  Future getTime(BuildContext context) async {
    pickedTime =
        await showTimePicker(context: context, initialTime: selectedTime!);

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        log("selectedTime = $pickedTime");
      });
    }
  }

  void dateTimeMethod() {
    dateTimeNow = DateTime.now();
    dateTimeTomorrow = dateTimeNow!.add(const Duration(days: 1));
    year = dateTimeTomorrow!.year;
    month = dateTimeTomorrow!.month;
    date = dateTimeTomorrow!.day;

    var data1 = DateFormat('dd MMMM yyyy').format(dateTimeNow!);
    var data2 = DateFormat('HH:mm').format(dateTimeNow!);
    var data3 = DateFormat('HH:mm:ss').format(dateTimeNow!);
    var data4 = DateFormat('yyyy-MM-dd').format(dateTimeNow!);
    var data5 = DateFormat('HH:mm:ss').format(dateTimeNow!);

    log("Data 1 = $data1");
    log("Data 2 = $data2");
    log("Data 3 = $data3");
    log("Data 4 = $data4");
    log("Data 5 = $data5");
    log("Year = $year");
    log("Month = $month");
    log("Day = $date");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MaterialButton(
            onPressed: () {
              getDate(context);
            },
            child: const Text("Test DatePicker"),
          ),
          MaterialButton(
            onPressed: () {
              getTime(context);
            },
            child: const Text("Test TimePicker"),
          ),
          Text(dateTimeNow.toString().length > 9
              ? dateTimeNow.toString().substring(0, 10)
              : ""),
          Text(selectedTime.toString().length > 14
              ? selectedTime.toString().substring(10, 15)
              : ""),
        ],
      ),
    );
  }
}
