// *****************************************************************************
// * | File        :	  api.dart
// * | Author      :   Nidhin Mahesh A
// * | Function    :   API calls
// *----------------
// * | This version:   V1.0.0
// * | Date        :   2020-02-10
// # | Info        :   Call get and post methods to receive or send payment
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

import 'package:http/http.dart' as http;
import 'dart:async';

String url = 'http://103.10.24.222:5050/Dispenser';

Future<String>getAddress() async {
  final _response = await http.get('$url/getAddress');
  print('Response status: ${_response.statusCode}');
  print(_response.body);
  return _response.body;
}

Future<String>postMessage(toAddress, data) async {
  final _message = await http.post('$url/sendData/$toAddress/$data');
  print('Response status: ${_message.statusCode}');
  print(_message.body);
  return _message.body;
}

Future<String>postPayment(toAddress, data) async {
  final _payment = await http.post('$url/sendData/$toAddress/$data');
  print('Response status: ${_payment.statusCode}');
  print(_payment.body);
  return _payment.body;
}