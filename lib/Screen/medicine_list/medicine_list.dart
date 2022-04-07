import 'package:flutter/material.dart';

import '../../routing_constants.dart';

class MedicineList extends StatefulWidget {
  MedicineList({Key? key}) : super(key: key);

  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () {
           Navigator.pushNamed(context, medicine_order);
        },
        child: const Text('MedicineList'),
      ),
    );
  }
}
