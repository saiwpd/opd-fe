import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

class FeeReciept extends StatefulWidget {
  FeeReciept({Key? key}) : super(key: key);

  @override
  State<FeeReciept> createState() => _FeeRecieptState();
}

class _FeeRecieptState extends State<FeeReciept> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () {
         
        },
        child: const Text('FeeReciept'),
      ),
    );
  }
}