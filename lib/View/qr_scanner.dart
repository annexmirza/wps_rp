import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wps_rp/Controller/qr_scanner_controller.dart';

class QRScannerPage extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QRScannerController>(
        init: QRScannerController(),
        builder: (qrScannerController) {
          // qrScannerController.reassembleQRController();
          return Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: QRView(
                      key: qrKey,
                      onQRViewCreated: (QRViewController controller) {
                        qrScannerController.onQRViewCreated(controller);
                      }),
                ),
                Expanded(
                  flex: 1,
                  child: (qrScannerController.result != null)
                      ? Text(
                          'Barcode Type: ${describeEnum(qrScannerController.result!.format)}   Data: ${qrScannerController.result!.code}')
                      : Text('Scan a code'),
                  //
                ),
              ],
            ),
          );
        });
  }
}
