import 'package:flutter/material.dart';
import 'home.dart'; // Import the HomePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transport App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
      routes: {
        '/bus-tracking': (context) => PlaceholderPage(pageName: 'Bus Tracking'),
        '/time-table': (context) => PlaceholderPage(pageName: 'Time Table'),
        '/seats-booking': (context) => PlaceholderPage(pageName: 'Seats Booking'),
        '/complaints': (context) => PlaceholderPage(pageName: 'Complaints'),
        '/emergency': (context) => PlaceholderPage(pageName: 'Emergency'),
        '/settings': (context) => PlaceholderPage(pageName: 'Settings'),
        '/qr-scanner': (context) => PlaceholderPage(pageName: 'QR Scanner'),
        '/wallet': (context) => PlaceholderPage(pageName: 'Wallet'),
        '/profile': (context) => PlaceholderPage(pageName: 'Profile'),
      },
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String pageName;
  PlaceholderPage({required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageName)),
      body: Center(child: Text('This is the $pageName page.')),
    );
  }
}