import 'package:flutter/material.dart';

class SeatBookingScreen extends StatefulWidget {
  @override
  _SeatBookingScreenState createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBookingScreen> {
  Map<String, String> seatStatus = {};

  @override
  void initState() {
    super.initState();
    _initializeSeats();
  }

  void _initializeSeats() {
    List<String> rows = ['A', 'B', 'C', 'D'];
    for (var row in rows) {
      for (int i = 1; i <= 12; i++) {
        seatStatus['$row$i'] = (i % 5 == 0) ? 'booked' : 'available';
      }
    }
  }

  void selectSeat(String seat) {
    setState(() {
      if (seatStatus[seat] == 'available') {
        seatStatus[seat] = 'selected';
      } else if (seatStatus[seat] == 'selected') {
        seatStatus[seat] = 'available';
      }
    });
  }

  Color getSeatColor(String status) {
    switch (status) {
      case 'available':
        return Colors.white;
      case 'booked':
        return Colors.grey;
      case 'selected':
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seat Booking'), backgroundColor: Colors.yellow[700]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSeatSection(["A", "B"]),
                    _buildSeatSection(["C", "D"]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Rs.${seatStatus.values.where((s) => s == 'selected').length * 800}.00",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to QRPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text("Continue", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeatSection(List<String> columns) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: columns
              .map((col) => Text(col, style: TextStyle(fontWeight: FontWeight.bold)))
              .toList(),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(12, (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _seatWidget('${columns[0]}${index + 1}'),
                SizedBox(width: 30),
                _seatWidget('${columns[1]}${index + 1}'),
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget _seatWidget(String seat) {
    return GestureDetector(
      onTap: seatStatus[seat] == 'booked' ? null : () => selectSeat(seat),
      child: Container(
        margin: EdgeInsets.all(6),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: getSeatColor(seatStatus[seat] ?? 'available'),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            seat,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// QRPage
class QRPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code'), backgroundColor: Colors.yellow[700]),
      body: Center(
        child: Text(
          'QR Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _navigateToSeatBooking(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SeatBookingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.airline_seat_recline_extra),
            onPressed: () => _navigateToSeatBooking(context),
            tooltip: 'Seat Booking',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}