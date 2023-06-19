import 'package:flutter/material.dart';

class PHValueSensor extends StatefulWidget {
  @override
  _PHValueSensorState createState() => _PHValueSensorState();
}

class _PHValueSensorState extends State<PHValueSensor> {

  List<Map<String, dynamic>> sensorData = [];



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pH Value Sensor'),
      ),
      body: Center(
      ),
    );
  }
}
