import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission handler
import 'dart:ui';
import 'qr_scanner_screen.dart'; // Import QR Scanner Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  String scannedResult = "";

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  // Function to request camera permission
  void _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  void _openQRScanner() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRScannerScreen()),
    );

    if (result != null) {
      setState(() {
        scannedResult = result;
      });
      _showBottomSheet(); // Show bottom sheet after scanning
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply blur effect
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.3,
              maxChildSize: 0.5,
              builder: (_, scrollController) {
                return Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Confirmation",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text("From                                                                                            Homagama ${fromController.text}"),
                        const SizedBox(height: 5),
                        Text("To                                                                                                       NSBM ${toController.text}"),
                        const SizedBox(height: 10),
                        const Text(
                          "Total                                                                                              RS 100.00",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Confirm",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Image.asset('assets/abc.jpg', height: 50), // Ensure the image path is correct
            const SizedBox(height: 10),
            const Text(
              "Your Journey, Your Way!",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Osandi Hirimuthogoda",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'), // Ensure this path is correct
                  radius: 20,
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: fromController,
              decoration: const InputDecoration(
                hintText: "From",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: toController,
              decoration: const InputDecoration(
                hintText: "To",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: _openQRScanner,
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                    label: const Text("Open Scanner", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(200, 200),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}