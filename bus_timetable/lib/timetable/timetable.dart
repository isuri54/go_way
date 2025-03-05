import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class TimeTablePage extends StatefulWidget {
  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref().child("buses");
  List<Map<String, dynamic>> busList = [];

  void fetchBuses() async {
    String from = fromController.text.trim();
    String to = toController.text.trim();
    if (to.isEmpty) return;

    databaseRef.once().then((DatabaseEvent event) {
      final snapshot = event.snapshot;
      if (snapshot.exists) {
        List<Map<String, dynamic>> buses = [];
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, data) {
          if (data["from"] == from && data["to"] == to) {
            buses.add({
              "busName": data["busName"],
              "startTime": data["startTime"],
              "endTime": data["endTime"],
              "price": data["pricePerKm"] * data["distance"],
              "contactNumber": data["contactNumber"],
              "availableSeats": data["totalSeats"] - data["bookedSeats"],
              "totalSeats": data["totalSeats"],
            });
          }
        });
        setState(() {
          busList = buses;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Time Table")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: fromController,
              decoration: InputDecoration(labelText: "From"),
              onChanged: (value) => fetchBuses(),
            ),
            TextField(
              controller: toController,
              decoration: InputDecoration(labelText: "To"),
              onChanged: (value) => fetchBuses(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: busList.length,
                itemBuilder: (context, index) {
                  return BusTile(busData: busList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BusTile extends StatefulWidget {
  final Map<String, dynamic> busData;
  BusTile({required this.busData});

  @override
  _BusTileState createState() => _BusTileState();
}

class _BusTileState extends State<BusTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.yellow,
            title: Text(widget.busData["busName"], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(widget.busData["startTime"]),
            trailing: IconButton(
              icon: Icon(expanded ? Icons.arrow_drop_up : Icons.directions_bus),
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
          ),
          if (expanded)
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Start Time: ${widget.busData["startTime"]}"),
                  Text("End Time: ${widget.busData["endTime"]}"),
                  Text("Price: Rs. ${widget.busData["price"]}"),
                  Text("Contact: ${widget.busData["contactNumber"]}"),
                  Text("Seats Available: ${widget.busData["availableSeats"]} / ${widget.busData["totalSeats"]}"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text("Book Now"),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
