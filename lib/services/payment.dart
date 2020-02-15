import 'package:flutter/material.dart';
import 'package:smart_dispenser/launch.dart';
import 'package:smart_dispenser/services/api/api.dart';

class Payment extends StatefulWidget {
  @override

  final String _setAddr;
  final String qrText;
  Payment(this._setAddr,this.qrText);
  _PaymentState createState() => _PaymentState(_setAddr,qrText);
}

class _PaymentState extends State<Payment> {

  String _setAddr;
  String qrText;
  _PaymentState(this._setAddr,this.qrText);

  int amount = 0;

  // call POST TXN function
  _pay() async {
    await postPayment(qrText, amount);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Launch()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 100.0,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
            child: Text("Complete Payment", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Amount to Pay',
              ),
            ),
          ),
          Center(
            child:
            OutlineButton(
              highlightedBorderColor: Colors.black,
              onPressed:_pay,
              child: const Text('Pay'),
            ),
          ),
        ],
      ),
    );
  }
}
