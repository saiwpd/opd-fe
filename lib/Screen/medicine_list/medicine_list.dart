import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "รายการยาทั้งหมด",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        Container(
          height: 30,
        ),
        Center(
            child: Container(
          alignment: Alignment.center,
          width: 350,
          height: 50,
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            textAlign: TextAlign.left,
            decoration: new InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.0),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.0),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              fillColor: Color(0xffE8DEF8),
              filled: true,
              suffixIcon: Icon(
                Icons.search,
                color: Color(0xFF65676B),
              ),
              hintText: 'ค้นหา...',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF65676B),
                  fontSize: 16),
            ),
          ),
        )),
        Container(
          height: 25,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  color: Color.fromARGB(255, 179, 149, 153),
                  height: 300.0,
                  alignment: Alignment.center,
                  child: const Text('mock scrollview'),
                ),
                Container(
                  color: Color.fromARGB(255, 199, 168, 143),
                  height: 250.0,
                  alignment: Alignment.center,
                  child: const Text('mock scrollview'),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 40,
        ),
        Container(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                primary: Colors.green,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pushNamed(context, medicine_order);
            },
            child: const Text('MedicineList'),
          ),
        ),
        Container(
          height: 10,
        ),
      ]),
    );
  }
}
