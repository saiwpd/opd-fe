import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

class MedicinePlan extends StatefulWidget {
  MedicinePlan({Key? key}) : super(key: key);

  @override
  State<MedicinePlan> createState() => _MedicinePlanState();
}

class _MedicinePlanState extends State<MedicinePlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () {
        
        },
        child: const Text('MedicinePlan'),
      ),
    );
  }
}