import 'package:appname/Screen/service_receipt/service_receipt.dart';
import 'package:flutter/material.dart';

import '../../routing_constants.dart';

class ServiceInvoice extends StatefulWidget {
  ServiceInvoice({Key? key}) : super(key: key);

  @override
  State<ServiceInvoice> createState() => _ServiceInvoiceState();
}

class _ServiceInvoiceState extends State<ServiceInvoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () {
          Navigator.pushNamed(context, service_reciept);
        },
        child: const Text('ServiceInvoice'),
      ),
    );
  }
}