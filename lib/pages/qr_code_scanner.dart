import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QR_code_scanner extends StatefulWidget {
  const QR_code_scanner({Key? key}) : super(key: key);

  @override
  _QR_code_scannerState createState() => _QR_code_scannerState();
}

class _QR_code_scannerState extends State<QR_code_scanner> {
  final qr_key = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  bool flashStatus = false;
  bool cameraStatus = false;

  Barcode? barcode;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    controller?.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }

    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('QR Code Scanner'),
        actions: [
          IconButton(
              onPressed: () async {
                await controller!.flipCamera();
                setState(() {
                  cameraStatus = !cameraStatus;
                });
              },
              icon: Icon(Icons.flip_camera_ios_outlined)),
          IconButton(
              onPressed: () async {
                await controller!.toggleFlash();
                setState(() {
                  flashStatus = !flashStatus;
                });
              },
              icon: flashStatus ? Icon(Icons.flash_on) : Icon(Icons.flash_off)),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQRview(context),
          Positioned(
              bottom: 10,
              child: InkWell(
                onTap: () async {
                  if (!await launch(
                    'http://www.google.com/search?q=${barcode!.code}',
                    forceSafariVC: true,
                    forceWebView: true,
                    enableJavaScript: true,
                  )) {
                    throw 'Could not launch';
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(8),
                  ),
                    child: Text(barcode != null
                        ? 'Result: ${barcode!.code}'
                        : 'Scan a code',
                    style: TextStyle(fontSize: 18,color: Colors.white),
                    maxLines: 3,)
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget buildQRview(BuildContext context) {
    return QRView(
      key: qr_key,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderRadius: 12,
          borderColor: Colors.white,
          borderLength: 22,
          borderWidth: 8),
    );
  }

  void onQRViewCreated(QRViewController _controller) {
    setState(() {
      controller = _controller;
    });

    controller!.scannedDataStream.listen((_barcode) {
      setState(() {
        barcode = _barcode;
      });
    });
  }
}
