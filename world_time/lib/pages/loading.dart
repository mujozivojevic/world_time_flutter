import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:word_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadinState createState() => _LoadinState();
}

class _LoadinState extends State<Loading> {
  String time = 'loading';

  void setUpWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Berlin', flag: 'german.png', url: 'Europe/Berlin');

    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
