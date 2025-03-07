import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedData = "";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

    void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedData = scanData.code ?? "No Data";
      });
      controller.pauseCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.black, // Set black color for camera view
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, scannedData);  // Pop and send scanned data back
                  },
                  child: const Text("Resume"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
