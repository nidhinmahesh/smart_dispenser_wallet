import 'package:flutter/material.dart';

class ListTransactions extends StatefulWidget {

  final String _setAddr;
  ListTransactions(this._setAddr);
  @override
  _ListTransactionsState createState() => _ListTransactionsState(_setAddr);
}

class _ListTransactionsState extends State<ListTransactions> {

  String _setAddr;
  _ListTransactionsState(this._setAddr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Transactions not available for: $_setAddr"),
      ),
    );
  }
}
