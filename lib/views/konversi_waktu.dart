// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({Key? key}) : super(key: key);

  @override
  State<KonversiWaktu> createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  DateTime _currentTime = DateTime.now();
  String _selectedLocation = 'WIB';

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  String _formatTime(DateTime time) {
    return DateFormat('EEEE, dd MMMM yyyy - HH:mm:ss').format(time);
  }

  List<String> locations = ['WIB', 'WITA', 'WIT', 'London'];

  Map<String, Duration> timeOffsets = {
    'WIB': Duration(hours: 7),
    'WITA': Duration(hours: 8),
    'WIT': Duration(hours: 9),
    'London': Duration(hours: 1),
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Konversi Waktu"),
            backgroundColor: Colors.blueGrey[300],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_selectedLocation}:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  _formatTime(_currentTime.toUtc().add(timeOffsets[_selectedLocation]!)),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                DropdownButton(
                  value: _selectedLocation,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLocation = newValue!;
                    });
                  },
                  isDense: true,
                  items: locations.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        )
    );
  }
}
