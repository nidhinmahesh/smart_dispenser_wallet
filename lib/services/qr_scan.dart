// *****************************************************************************
// * | File        :	  qr_scan.dart
// * | Author      :   Nidhin Mahesh A
// * | Function    :   Scan QR code
// *----------------
// * | This version:   V1.0.0
// * | Date        :   2020-02-10
// # | Info        :   Using 3rd party package to scan QR code for
//                      DLT transaction.
// -----------------------------------------------------------------------------
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to  whom the Software is
// furished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS OR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:smart_dispenser/services/payment.dart';

class QrScan extends StatefulWidget {

  final String _setAddr;
  QrScan(this._setAddr);

  @override
  State<StatefulWidget> createState() => _QrScanState(_setAddr);
}

class _QrScanState extends State<QrScan> {

  String _setAddr;

  _QrScanState(this._setAddr);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Text('Scan result: $qrText'),
                RaisedButton(
                  child: Text("Proceed to pay"),
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Payment(_setAddr,qrText)),
                      );
                    },),
              ],
            ),
//            child: Center(
//              child: Text('Scan result: $qrText'),
//            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}