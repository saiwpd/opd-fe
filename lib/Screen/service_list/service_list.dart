import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatefulWidget {
  ServiceList({Key? key}) : super(key: key);

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () {
          Navigator.pushNamed(context, service_invioce);
        },
        child: const Text('ServiceList'),
      ),
    );
  }
}