// *****************************************************************************
// * | File        :	  Launch.dart
// * | Author      :   Nidhin Mahesh A
// * | Function    :   Launch screen
// * | Info        :
// *----------------
// * | This version:   V1.0.0
// * | Date        :   2020-01-05
// # | Info        : Launch Screen of Dispenser application
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

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(EvaIcons.barChart),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(0);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(EvaIcons.diagonalArrowRightUp),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(1);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(EvaIcons.diagonalArrowRightDown),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(2);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(EvaIcons.settings2),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(3);
                  });
                },
              )
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          Center(
            child: Container(
              child: CreditCard(
                cardNumber: "5450 7879 4864 7854",
                cardExpiry: "10/25",
                cardHolderName: "Card Holder",
                cvv: "456",
                bankName: "Axis Bank",
                showBackSide: false,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
              ),
            ),
          ),
          Center(
            child: Container(
              child: Text('Given to the market'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Bought from market'),
            ),
          ),
          Center(
            child: Container(
              child: Text('App settings'),
            ),
          ),
          Center(
            child: Container(
              child: Text('all transactions'),
            ),
          ),
        ],
        physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _myPage.jumpToPage(4);
              });
            },
            child: Icon(
              EvaIcons.bookOutline,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    );
  }
}
