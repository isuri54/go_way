import 'package:bus_tracking/bus_tracking/bus_tracking.dart';
import 'package:flutter/material.dart';


void main()  {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BusTrackingPage(),
    );
  }
}
