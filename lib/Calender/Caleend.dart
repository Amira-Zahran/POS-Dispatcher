import 'package:flutter/material.dart';

class Calend extends StatefulWidget {
  const Calend({Key? key}) : super(key: key);

  @override
  State<Calend> createState() => _CalendState();
}

class _CalendState extends State<Calend> {
  late DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_dateTime == null ? 'Nothing has been picked yet' : _dateTime.toString()),
            RaisedButton(
              child: Text('Pick a date'),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2021)
                ).then((date) {
                  setState(() {
                    _dateTime = date!;
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}