import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

class ServiceReciept extends StatefulWidget {
  ServiceReciept({Key? key}) : super(key: key);

  @override
  State<ServiceReciept> createState() => _ServiceRecieptState();
}

class _ServiceRecieptState extends State<ServiceReciept> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () {
         
        },
        child: const Text('ServiceReciept'),
      ),
    );
  }
}