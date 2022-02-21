import 'dart:io';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerController extends GetxController {
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  reassembleQRController() {
    if (Platform.isAndroid) {
      controller!.pauseCamera();
      update();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
      update();
    }
  }

  disposeQRController() {
    controller?.dispose();
    update();
  }

  onQRViewCreated(QRViewController controller) {
    //this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      update();
    });
  }
}
