import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

class MedicineOrder extends StatefulWidget {
  MedicineOrder({Key? key}) : super(key: key);

  @override
  State<MedicineOrder> createState() => _MedicineOrderState();
}

class _MedicineOrderState extends State<MedicineOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () {
          Navigator.pushNamed(context, medicine_plan);
        },
        child: const Text('MedicineOrder'),
      ),
    );
  }
}