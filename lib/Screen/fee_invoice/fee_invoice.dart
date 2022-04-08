import 'package:appname/Screen/fee_receipt/fee_receipt.dart';
import 'package:flutter/material.dart';

import '../../routing_constants.dart';

class FeeInvoice extends StatefulWidget {
  FeeInvoice({Key? key}) : super(key: key);

  @override
  State<FeeInvoice> createState() => _FeeInvoiceState();
}

class _FeeInvoiceState extends State<FeeInvoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () {
          Navigator.pushNamed(context, fee_reciept);
        },
        child: const Text('FeeInvoice'),
      ),
    );
  }
}