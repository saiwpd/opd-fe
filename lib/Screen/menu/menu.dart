import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            "Menu",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                primary: Color(0xffE8DEF8),
                onPrimary: Colors.black,
                fixedSize: const Size(300, 100),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            onPressed: () {
              Navigator.pushNamed(context, medicine_list);
            },
            child: const Text('Medicine List'),
          ),
          Container(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                primary: Color(0xffE8DEF8),
                onPrimary: Colors.black,
                fixedSize: const Size(300, 100),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            onPressed: () {
              Navigator.pushNamed(context, fee_list);
            },
            child: const Text('Fee List'),
          ),
          Container(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                primary: Color(0xffE8DEF8),
                onPrimary: Colors.black,
                fixedSize: const Size(300, 100),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            onPressed: () {
              Navigator.pushNamed(context, prescription_list);
            },
            child: const Text('Presciption List'),
          ),
          Container(
            height: 20,
          ),
          
        ])));
  }
}
