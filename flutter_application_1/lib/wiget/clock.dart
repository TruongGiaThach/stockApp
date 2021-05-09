import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyClock extends StatefulWidget {
  MyClock({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyClockState createState() => _MyClockState();
}

class _MyClockState extends State<MyClock> with TickerProviderStateMixin {
  DateTime _date = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        direction: Axis.horizontal,
        children: <Widget>[
          Text(
            _date.hour.toString(),
            textAlign: TextAlign.right,
            style: _getTextStyle(),
          ),
          Text(
            ":",
            style: _getTextStyle(),
          ),
          Text(
            _date.minute <= 9 ? "0${_date.minute}" : _date.minute.toString(),
            textAlign: TextAlign.left,
            style: _getTextStyle(),
          ),
          Text(
            ":",
            style: _getTextStyle(),
          ),
          Text(
            _date.second <= 9 ? "0${_date.second}" : _date.second.toString(),
            textAlign: TextAlign.left,
            style: _getTextStyle(),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  void _updateTime() {
    setState(() {
      _date = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1) -
            Duration(seconds: _date.second) -
            Duration(milliseconds: _date.millisecond),
        () {
          _updateTime();
        },
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel(); //the same as `if (_timer != null) _timer.cancel`
  }

  TextStyle _getTextStyle() => TextStyle(
      fontSize: 50, color: Colors.lightGreen, fontWeight: FontWeight.bold);
}
