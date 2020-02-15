// *****************************************************************************
// * | File        :	  qr_render.dart
// * | Author      :   Nidhin Mahesh A
// * | Function    :   render or generate QR code
// *----------------
// * | This version:   V1.0.0
// * | Date        :   2020-02-10
// # | Info        :   Using 3rd party package to render or generate QR code for
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

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrRender extends StatefulWidget {
  final String _setAddr;

  QrRender(this._setAddr);

  @override
  _QrRenderState createState() => _QrRenderState(_setAddr);
}

class _QrRenderState extends State<QrRender> {
  String _setAddr;

  _QrRenderState(this._setAddr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 100.0),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
              child: QrImage(
                data: _setAddr,
                version: QrVersions.auto,
                size: 300.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "  Show this QR code to recieve payment",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
          ),
          Spacer(),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
              child: OutlineButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(EvaIcons.copyOutline),
                  label: Text(
                    "Scan QR Code",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 24.0),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
