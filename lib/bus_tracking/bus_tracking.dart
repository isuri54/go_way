import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class BusTrackingPage extends StatefulWidget {
  @override
  _BusTrackingPageState createState() => _BusTrackingPageState();
}

class _BusTrackingPageState extends State<BusTrackingPage> {
  GoogleMapController? _mapController;
  LatLng _userLocation = LatLng(6.9271, 79.8612); // Default: Colombo
  LatLng? _busLocation;
  String from = '';
  String to = '';

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _listenToBusLocation(); // Live tracking if booked
  }

  // Get User's Current Location
  Future<void> _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });
  }

  // Listen for Bus Location Updates
  void _listenToBusLocation() {
    FirebaseFirestore.instance.collection('buses').doc('bus_123').snapshots().listen((snapshot) {
      if (snapshot.exists) {
        var data = snapshot.data();
        if (data != null && mounted) {
          setState(() {
            _busLocation = LatLng(data['latitude'], data['longitude']);
          });
        }
      }
    });
  }

  // Draw Route on Map (Dummy function, integrate Directions API for actual implementation)
  void _drawRoute() {
    // Fetch bus route between 'from' and 'to' and draw polyline
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bus Tracking')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'From'),
                    onChanged: (value) => setState(() => from = value),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'To'),
                    onChanged: (value) => setState(() => to = value),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: _userLocation, zoom: 14),
              onMapCreated: (controller) => _mapController = controller,
              markers: {
                Marker(markerId: MarkerId('user'), position: _userLocation, infoWindow: InfoWindow(title: 'You')),
                if (_busLocation != null)
                  Marker(markerId: MarkerId('bus'), position: _busLocation!, icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), infoWindow: InfoWindow(title: 'Bus'))
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _drawRoute,
        child: Icon(Icons.directions),
      ),
    );
  }
}
