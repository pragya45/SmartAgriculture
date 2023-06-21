import 'package:flutter/material.dart';

class PHValueSensor extends StatefulWidget {
  @override
  _PHValueSensorState createState() => _PHValueSensorState();
}

class _PHValueSensorState extends State<PHValueSensor> {
  double pH = 0.0;
  List<Map<String, dynamic>> sensorData = [];


  @override
  void initState() {
    super.initState();

  }




  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pH Value Sensor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current pH Value',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}


