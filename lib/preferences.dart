// *****************************************************************************
// * | File        :	  preferences.dart
// * | Author      :   Nidhin Mahesh A
// * | Function    :   Edit personal settings
// * | Info        :
// *----------------
// * | This version:   V1.0.0
// * | Date        :   2020-01-05
// # | Info        : change or add information related to user.
// -----------------------------------------------------------------------------
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documnetation files (the "Software"), to deal
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

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 100.0,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
            child: Text("Preferences", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nickname',
              ),
              // ignore: missing_return
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Nickname is required';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Full name',
              ),
              // ignore: missing_return
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Full name is required';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'email',
              ),
              // ignore: missing_return
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Email is required';
                }
              },
            ),
          ),
          Center(
            child:
              OutlineButton(
                highlightedBorderColor: Colors.black,
                onPressed:_submittable() ? _submit : null,
                child: const Text('Save'),
              ),
          ),
        ],
      ),
    );
  }

  bool _submittable() {
    return _agreedToTOS;
  }

  void _submit() {
    _formKey.currentState.validate();
    print('Form submitted');
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }
}